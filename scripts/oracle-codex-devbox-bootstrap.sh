#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/nobutakayamauchi/Ultimate-Loop.git"
TARGET_BRANCH="codex/ultimate-loop-runtime-v0"
DEV_ROOT="${HOME}/dev"
REPO_DIR="${DEV_ROOT}/Ultimate-Loop"
BIN_DIR="${HOME}/bin"
HELPER="${BIN_DIR}/ultimate-loop-dogfood"

say() { printf '\n==> %s\n' "$*"; }
fail() { printf '\nERROR: %s\n' "$*" >&2; exit 1; }

if command -v sudo >/dev/null 2>&1 && [ "$(id -u)" -ne 0 ]; then
  SUDO=sudo
else
  SUDO=""
fi

say "Installing minimal OS dependencies"
${SUDO} apt-get update -y
${SUDO} apt-get install -y ca-certificates curl git

say "Installing/updating Codex CLI from the official OpenAI installer"
# Force the official installer into non-interactive mode so it cannot stop the
# bootstrap at uninstall/start-now prompts. The user-local standalone binary is
# preferred explicitly below via PATH.
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh

export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"
mkdir -p "${BIN_DIR}" "${DEV_ROOT}"

if ! command -v codex >/dev/null 2>&1; then
  fail "Codex installed but is not on PATH. Check the installer output, then add its bin directory to PATH."
fi

PROFILE_FILE="${HOME}/.profile"
PATH_LINE='export PATH="$HOME/.local/bin:$HOME/bin:$PATH"'
if ! grep -Fqx "$PATH_LINE" "$PROFILE_FILE" 2>/dev/null; then
  printf '\n%s\n' "$PATH_LINE" >> "$PROFILE_FILE"
fi

say "Preparing clean Ultimate-Loop dogfood checkout"
if [ -d "${REPO_DIR}/.git" ]; then
  cd "${REPO_DIR}"
  if [ -n "$(git status --porcelain)" ]; then
    fail "${REPO_DIR} has local changes. Refusing to overwrite them."
  fi
  git fetch origin --prune
  git checkout -B "${TARGET_BRANCH}" "origin/${TARGET_BRANCH}"
else
  git clone --branch "${TARGET_BRANCH}" --single-branch "${REPO_URL}" "${REPO_DIR}"
fi

cd "${REPO_DIR}"

for required in \
  AGENTS.md \
  .agents/skills/ultimate-loop/SKILL.md \
  .codex/agents/devils-advocate.toml \
  .codex/agents/counter-advocate.toml \
  .codex/agents/reality-verifier.toml; do
  [ -f "$required" ] || fail "Missing runtime adapter file: $required"
done

say "Creating local dogfood runner outside the repository"
cat > "${HELPER}" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/dev/Ultimate-Loop"
cd "${REPO_DIR}"
export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex is not on PATH." >&2
  exit 1
fi

if ! codex login status >/dev/null 2>&1; then
  echo
  echo "Codex is not authenticated. Starting headless device-code login."
  echo "Open the URL shown below on this phone, sign in, and enter the one-time code."
  echo
  codex login --device-auth
fi

codex login status
codex --version

git fetch origin --prune >/dev/null 2>&1 || true
if [ "$(git rev-parse --abbrev-ref HEAD)" != "codex/ultimate-loop-runtime-v0" ]; then
  echo "Wrong branch: $(git rev-parse --abbrev-ref HEAD)" >&2
  exit 1
fi
if [ -n "$(git status --porcelain)" ]; then
  echo "Working tree is dirty before dogfood; refusing to continue." >&2
  git status --short >&2
  exit 1
fi

repo_fingerprint() {
  {
    git rev-parse HEAD
    git status --porcelain=v1 --untracked-files=all
    find . -type f -not -path './.git/*' -print0 \
      | LC_ALL=C sort -z \
      | xargs -0 sha256sum
  } | sha256sum | awk '{print $1}'
}

PRE_HEAD="$(git rev-parse HEAD)"
PRE_FP="$(repo_fingerprint)"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
LOG="/tmp/ultimate-loop-dogfood-${STAMP}.log"

PROMPT=$(cat <<'PROMPT_EOF'
/goal

Run a bounded, NO-MUTATION runtime dogfood of this repository's Codex-native Ultimate Loop adapter. This is PR #6 / branch codex/ultimate-loop-runtime-v0.

Do not edit files, create commits, change branches, install anything, or push. Treat the repository as evidence only.

Using runtime behavior rather than file-existence claims alone, determine:
1. whether the root AGENTS.md was loaded and materially governs this session;
2. whether the repository skill `ultimate-loop` is discovered/available and the `/goal` request routes into it;
3. whether the project custom agents `devils-advocate`, `counter-advocate`, and `reality-verifier` are discovered by name;
4. if project custom agents are supported here, run Devil's Advocate -> Counter-Advocate -> Reality Verifier against the claim `PR #6 is runtime-ready`;
5. report the effective sandbox/permission behavior you actually observe. Do not infer technical read-only merely from TOML text;
6. preserve UNKNOWN/BLOCKED for anything the runtime cannot prove;
7. do not repair findings in this run.

Hard distinctions:
- REPOSITORY_IMPLEMENTED != CODEX_RUNTIME_VALIDATED
- READ_ONLY_REQUESTED != READ_ONLY_PROVEN
- COMMIT != RUNTIME_CORRECTNESS

End with exactly one of `RUNTIME_PASS`, `RUNTIME_FAIL`, or `RUNTIME_BLOCKED`, followed by the smallest missing evidence or next action.
PROMPT_EOF
)

echo
printf '=== PRE DOGFOOD ===\nHEAD=%s\nFINGERPRINT=%s\n' "$PRE_HEAD" "$PRE_FP"
echo

codex exec --sandbox read-only --ephemeral "$PROMPT" 2>&1 | tee "$LOG"

POST_HEAD="$(git rev-parse HEAD)"
POST_FP="$(repo_fingerprint)"

echo
printf '=== POST DOGFOOD ===\nHEAD=%s\nFINGERPRINT=%s\n' "$POST_HEAD" "$POST_FP"
if [ "$PRE_HEAD" = "$POST_HEAD" ] && [ "$PRE_FP" = "$POST_FP" ]; then
  echo "MUTATION_EVIDENCE=CLEAN"
else
  echo "MUTATION_EVIDENCE=CONTAMINATED"
  echo "Runtime verdict must not be promoted until this mutation is explained."
  git status --short
fi

echo "DOGFOOD_LOG=${LOG}"
EOF
chmod +x "${HELPER}"

say "Bootstrap complete"
printf 'Codex: %s\n' "$(codex --version)"
printf 'Repo:  %s\n' "${REPO_DIR}"
printf 'HEAD:  %s\n' "$(git rev-parse HEAD)"
printf '\nNext command:\n  %s\n\n' "${HELPER}"
printf 'That runner will start device-code login if needed, then execute the read-only PR #6 dogfood.\n'
