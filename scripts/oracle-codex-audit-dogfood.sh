#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/nobutakayamauchi/Ultimate-Loop.git"
TARGET_BRANCH="codex/ultimate-loop-runtime-v0"
AUDIT_USER="codex-audit"
AUDIT_HOME="/home/${AUDIT_USER}"
AUDIT_REPO="/srv/ultimate-loop-audit"
AUDIT_CODEX="${AUDIT_HOME}/.local/bin/codex"

say() { printf '\n==> %s\n' "$*"; }
fail() { printf '\nERROR: %s\n' "$*" >&2; exit 1; }

command -v sudo >/dev/null 2>&1 || fail "sudo is required for the OS-level audit boundary."
command -v git >/dev/null 2>&1 || fail "git is required."
command -v curl >/dev/null 2>&1 || fail "curl is required."

if ! id "$AUDIT_USER" >/dev/null 2>&1; then
  say "Creating non-privileged audit user"
  sudo useradd --create-home --shell /bin/bash "$AUDIT_USER"
fi
# The audit identity must never receive sudo authority.
sudo gpasswd -d "$AUDIT_USER" sudo >/dev/null 2>&1 || true

say "Installing/updating Codex inside the audit user's own HOME"
if [ ! -x "$AUDIT_CODEX" ]; then
  INSTALLER="$(mktemp)"
  curl -fsSL https://chatgpt.com/codex/install.sh -o "$INSTALLER"
  chmod a+r "$INSTALLER"
  # Fresh audit users have no competing npm install. Feed the default-safe `n`
  # to the optional "Start Codex now?" prompt so the bootstrap continues.
  printf 'n\n' | sudo -u "$AUDIT_USER" -H env HOME="$AUDIT_HOME" sh "$INSTALLER"
  rm -f "$INSTALLER"
fi
[ -x "$AUDIT_CODEX" ] || fail "Audit-user Codex install did not create $AUDIT_CODEX"
sudo -u "$AUDIT_USER" -H env HOME="$AUDIT_HOME" PATH="${AUDIT_HOME}/.local/bin:/usr/local/bin:/usr/bin:/bin" "$AUDIT_CODEX" --version

say "Preparing fresh root-owned, read-only PR #6 checkout"
sudo rm -rf "$AUDIT_REPO"
sudo git clone --branch "$TARGET_BRANCH" --single-branch "$REPO_URL" "$AUDIT_REPO"
sudo chown -R root:root "$AUDIT_REPO"
sudo chmod -R a-w "$AUDIT_REPO"
sudo find "$AUDIT_REPO" -type d -exec chmod a+rx {} +
sudo find "$AUDIT_REPO" -type f -exec chmod a+r {} +

for required in \
  AGENTS.md \
  .agents/skills/ultimate-loop/SKILL.md \
  .codex/config.toml \
  .codex/agents/devils-advocate.toml \
  .codex/agents/counter-advocate.toml \
  .codex/agents/reality-verifier.toml; do
  sudo test -f "${AUDIT_REPO}/${required}" || fail "Missing runtime adapter file: $required"
done

say "Preparing Codex authentication and explicit project trust for the audit identity"
sudo install -d -o "$AUDIT_USER" -g "$AUDIT_USER" -m 0700 "${AUDIT_HOME}/.codex"
if [ -f "${HOME}/.codex/auth.json" ]; then
  sudo install -o "$AUDIT_USER" -g "$AUDIT_USER" -m 0600 \
    "${HOME}/.codex/auth.json" "${AUDIT_HOME}/.codex/auth.json"
fi

AUDIT_USER_CONFIG="${AUDIT_HOME}/.codex/config.toml"
TMP_CONFIG="$(mktemp)"
cat > "$TMP_CONFIG" <<EOF
[projects."${AUDIT_REPO}"]
trust_level = "trusted"
EOF
sudo install -o "$AUDIT_USER" -g "$AUDIT_USER" -m 0600 "$TMP_CONFIG" "$AUDIT_USER_CONFIG"
rm -f "$TMP_CONFIG"

AUDIT_ENV=(env HOME="$AUDIT_HOME" CODEX_HOME="${AUDIT_HOME}/.codex" PATH="${AUDIT_HOME}/.local/bin:/usr/local/bin:/usr/bin:/bin")
if ! sudo -u "$AUDIT_USER" -H "${AUDIT_ENV[@]}" "$AUDIT_CODEX" login status >/dev/null 2>&1; then
  echo
  echo "The isolated audit user needs Codex authentication."
  echo "Open the device-login URL on this phone and enter the one-time code."
  echo
  sudo -u "$AUDIT_USER" -H "${AUDIT_ENV[@]}" "$AUDIT_CODEX" login --device-auth
fi

# Root ownership makes Git correctly suspicious; explicitly mark only this audit checkout safe.
sudo -u "$AUDIT_USER" -H env HOME="$AUDIT_HOME" git config --global --replace-all safe.directory "$AUDIT_REPO"

repo_fingerprint() {
  sudo find "$AUDIT_REPO" -type f -print0 \
    | LC_ALL=C sort -z \
    | sudo xargs -0 sha256sum \
    | sha256sum \
    | awk '{print $1}'
}

PRE_HEAD="$(sudo git -C "$AUDIT_REPO" rev-parse HEAD)"
PRE_FP="$(repo_fingerprint)"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
LOG="/tmp/ultimate-loop-audit-dogfood-${STAMP}.log"

PROMPT=$(cat <<'PROMPT_EOF'
/goal

Run the second bounded runtime dogfood of PR #6. The repository is intentionally owned by root and exposed here as an OS-level read-only candidate for your non-privileged process. Do not attempt to change permissions, escalate privileges, edit files, install anything, commit, push, or repair findings.

This run must distinguish runtime discovery from file existence.

1. Report whether root `AGENTS.md` materially governs this session.
2. Report whether the repository skill `ultimate-loop` is discovered/available and whether this `/goal` request routed into it.
3. Test the project custom roles explicitly. For each spawn, use the runtime role field `agent_type` exactly as follows and use `fork_turns="none"`:
   - `agent_type="devils-advocate"`, task_name `runtime_da`
   - `agent_type="counter-advocate"`, task_name `runtime_counter_da`
   - `agent_type="reality-verifier"`, task_name `runtime_reality_verifier`
   A matching task_name without `agent_type` is NOT evidence that the custom role loaded.
4. Give Devil's Advocate the claim `PR #6 is runtime-ready`; give Counter-Advocate the actual DA findings; give Reality Verifier the reconciled evidence. Run them sequentially, not concurrently.
5. Treat a successful spawn with the named `agent_type` as role-discovery evidence. Preserve the exact runtime error if a role is unknown or malformed.
6. The Codex/bwrap sandbox is intentionally not the write boundary in this Oracle run. The outer OS account has no sudo authority and the candidate checkout is root-owned/read-only.
7. Preserve UNKNOWN/BLOCKED rather than inferring success.

Hard distinctions:
- REPOSITORY_IMPLEMENTED != CODEX_RUNTIME_VALIDATED
- TASK NAME != CUSTOM ROLE
- PROMPT NON-MUTATION != TECHNICAL READ-ONLY
- CLEAN FINGERPRINT != WRITE CAPABILITY ABSENT
- COMMIT != RUNTIME CORRECTNESS

End with exactly one of `RUNTIME_PASS`, `RUNTIME_FAIL`, or `RUNTIME_BLOCKED`, followed by the smallest missing evidence or next action.
PROMPT_EOF
)

say "Starting OS-isolated Codex runtime dogfood"
printf 'AUDIT_USER=%s\nAUDIT_REPO=%s\nPRE_HEAD=%s\nPRE_FINGERPRINT=%s\n' \
  "$AUDIT_USER" "$AUDIT_REPO" "$PRE_HEAD" "$PRE_FP"

# The Linux ownership boundary, not bwrap, is the technical write barrier.
sudo -u "$AUDIT_USER" -H "${AUDIT_ENV[@]}" \
  "$AUDIT_CODEX" exec --sandbox danger-full-access --ephemeral -C "$AUDIT_REPO" "$PROMPT" \
  2>&1 | tee "$LOG"

POST_HEAD="$(sudo git -C "$AUDIT_REPO" rev-parse HEAD)"
POST_FP="$(repo_fingerprint)"

printf '\n=== POST DOGFOOD ===\nHEAD=%s\nFINGERPRINT=%s\n' "$POST_HEAD" "$POST_FP"
if [ "$PRE_HEAD" = "$POST_HEAD" ] && [ "$PRE_FP" = "$POST_FP" ]; then
  echo "MUTATION_EVIDENCE=CLEAN"
else
  echo "MUTATION_EVIDENCE=CONTAMINATED"
fi

if sudo -u "$AUDIT_USER" -H test -w "$AUDIT_REPO"; then
  echo "OS_WRITE_BOUNDARY=FAIL_REPO_DIR_WRITABLE"
else
  echo "OS_WRITE_BOUNDARY=PASS_REPO_DIR_NOT_WRITABLE"
fi

PROBE="${AUDIT_REPO}/.ultimate-loop-write-probe"
if sudo -u "$AUDIT_USER" -H sh -c "printf probe > '$PROBE'" 2>/dev/null; then
  echo "OS_WRITE_PROBE=FAIL_WRITE_SUCCEEDED"
  sudo rm -f "$PROBE"
else
  echo "OS_WRITE_PROBE=PASS_WRITE_DENIED"
fi

echo "DOGFOOD_LOG=${LOG}"
