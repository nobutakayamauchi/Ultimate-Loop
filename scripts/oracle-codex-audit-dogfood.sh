#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/nobutakayamauchi/Ultimate-Loop.git"
TARGET_BRANCH="codex/ultimate-loop-runtime-v0"
AUDIT_USER="codex-audit"
AUDIT_HOME="/home/${AUDIT_USER}"
AUDIT_REPO="/srv/ultimate-loop-audit"
AUDIT_CODEX="/usr/local/bin/codex-audit-runtime"

say() { printf '\n==> %s\n' "$*"; }
fail() { printf '\nERROR: %s\n' "$*" >&2; exit 1; }

command -v sudo >/dev/null 2>&1 || fail "sudo is required for the OS-level audit boundary."
command -v git >/dev/null 2>&1 || fail "git is required."
command -v codex >/dev/null 2>&1 || fail "codex is not on PATH for the current user."

CODEX_REAL="$(readlink -f "$(command -v codex)")"
[ -x "$CODEX_REAL" ] || fail "Could not resolve the installed Codex executable."

say "Installing a root-owned Codex runtime copy for the audit account"
sudo install -o root -g root -m 0755 "$CODEX_REAL" "$AUDIT_CODEX"

if ! id "$AUDIT_USER" >/dev/null 2>&1; then
  say "Creating non-privileged audit user"
  sudo useradd --create-home --shell /bin/bash "$AUDIT_USER"
fi
# The audit identity must never receive sudo authority.
sudo gpasswd -d "$AUDIT_USER" sudo >/dev/null 2>&1 || true

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

say "Preparing Codex authentication for the audit identity"
sudo install -d -o "$AUDIT_USER" -g "$AUDIT_USER" -m 0700 "${AUDIT_HOME}/.codex"
if [ -f "${HOME}/.codex/auth.json" ]; then
  sudo install -o "$AUDIT_USER" -g "$AUDIT_USER" -m 0600 \
    "${HOME}/.codex/auth.json" "${AUDIT_HOME}/.codex/auth.json"
fi

if ! sudo -u "$AUDIT_USER" -H env CODEX_HOME="${AUDIT_HOME}/.codex" "$AUDIT_CODEX" login status >/dev/null 2>&1; then
  echo
  echo "The isolated audit user needs Codex authentication."
  echo "Open the device-login URL on this phone and enter the one-time code."
  echo
  sudo -u "$AUDIT_USER" -H env CODEX_HOME="${AUDIT_HOME}/.codex" "$AUDIT_CODEX" login --device-auth
fi

# Root ownership makes Git correctly suspicious; explicitly mark only this audit checkout safe
# for the non-privileged audit identity.
sudo -u "$AUDIT_USER" -H git config --global --replace-all safe.directory "$AUDIT_REPO"

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

Run the second bounded runtime dogfood of PR #6. The repository is intentionally owned by root and mounted here as an OS-level read-only candidate for your non-privileged process. Do not attempt to change permissions, escalate privileges, edit files, install anything, commit, push, or repair findings.

This run must distinguish runtime discovery from file existence.

1. Report whether root `AGENTS.md` materially governs this session.
2. Report whether the repository skill `ultimate-loop` is discovered/available and whether this `/goal` request routed into it.
3. Test the project custom roles explicitly. For each spawn, use the runtime role field `agent_type` exactly as follows and use `fork_turns="none"` to avoid inherited-thread fork noise:
   - `agent_type="devils-advocate"`, task_name `runtime_da`
   - `agent_type="counter-advocate"`, task_name `runtime_counter_da`
   - `agent_type="reality-verifier"`, task_name `runtime_reality_verifier`
   A matching task_name without `agent_type` is NOT evidence that the custom role loaded.
4. Give Devil's Advocate the claim `PR #6 is runtime-ready`; give Counter-Advocate the actual DA findings; give Reality Verifier the reconciled evidence. Run them sequentially, not concurrently.
5. Treat a successful spawn with the named `agent_type` as role-discovery evidence. Preserve the exact runtime error if a role is unknown or malformed.
6. The process-level Codex sandbox is intentionally not the write boundary in this Oracle run. The outer OS account has no sudo authority and the candidate checkout is root-owned/read-only. Report any inability to execute ordinary read-only commands separately from custom-role discovery.
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

# No Codex/bwrap sandbox here: the Linux ownership boundary is the technical write barrier.
# The audit user cannot mutate the root-owned checkout or use sudo.
sudo -u "$AUDIT_USER" -H env \
  CODEX_HOME="${AUDIT_HOME}/.codex" \
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
