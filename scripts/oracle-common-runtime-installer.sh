#!/usr/bin/env bash
set -euo pipefail

REPO="${ULTIMATE_LOOP_REPO:-https://github.com/nobutakayamauchi/Ultimate-Loop.git}"
REF="${ULTIMATE_LOOP_REF:-main}"
CH="${CODEX_HOME:-$HOME/.codex}"
SKILL="$HOME/.agents/skills/ultimate-loop"
BIN="$HOME/.local/bin"
STATE="$HOME/.local/share/ultimate-loop"
MANIFEST="$STATE/runtime.env"
GLOBAL="$CH/AGENTS.md"
WRAPPER="$BIN/ultimate-loop-codex"
ACTION="${1:-install}"

say(){ printf '\n==> %s\n' "$*"; }
fail(){ printf '\nERROR: %s\n' "$*" >&2; exit 1; }
for x in curl git sed awk mktemp install; do command -v "$x" >/dev/null || fail "$x is required"; done

managed_block(){ cat <<'BLOCK'
<!-- ULTIMATE_LOOP_RUNTIME_BEGIN -->
## Ultimate Loop global runtime
When the user writes `/goal` or explicitly asks to run Ultimate Loop, use the installed `ultimate-loop` skill when available. Repository-local `AGENTS.md`, canonical documents, permissions, and Human Gates remain authoritative for repository-specific behavior.

For material architecture or promotion decisions, use the custom roles explicitly through the runtime role field: `devils-advocate`, `counter-advocate`, and `reality-verifier`. A task name resembling a role is not evidence that the custom role loaded.

Preserve: `REPOSITORY_IMPLEMENTED != CODEX_RUNTIME_VALIDATED`; `PROMPT NON-MUTATION != TECHNICAL READ-ONLY`; `TASK NAME != CUSTOM ROLE`.
<!-- ULTIMATE_LOOP_RUNTIME_END -->
BLOCK
}

strip_block(){
  [ -f "$GLOBAL" ] || return 0
  t="$(mktemp)"; sed '/<!-- ULTIMATE_LOOP_RUNTIME_BEGIN -->/,/<!-- ULTIMATE_LOOP_RUNTIME_END -->/d' "$GLOBAL" >"$t"
  install -m 0600 "$t" "$GLOBAL"; rm -f "$t"
}

status(){
  echo ULTIMATE_LOOP_RUNTIME_STATUS
  [ -f "$MANIFEST" ] && cat "$MANIFEST" || echo installed=false
  printf 'skill=%s\n' "$( [ -f "$SKILL/SKILL.md" ] && echo present || echo missing )"
  for r in devils-advocate counter-advocate reality-verifier; do printf 'role_%s=%s\n' "$r" "$( [ -f "$CH/agents/$r.toml" ] && echo present || echo missing )"; done
  printf 'wrapper=%s\n' "$( [ -x "$WRAPPER" ] && echo present || echo missing )"
  [ -x "$BIN/codex" ] && "$BIN/codex" --version || true
}

smoke(){
  [ -x "$WRAPPER" ] || fail "Install the runtime before smoke testing"
  d="$(mktemp -d)"; trap 'rm -rf "$d"' RETURN
  printf '# Ultimate Loop global runtime smoke\n' >"$d/README.md"
  before="$(sha256sum "$d/README.md" | awk '{print $1}')"
  out="$(mktemp)"
  (cd "$d" && "$WRAPPER" --goal 'Global runtime discovery smoke only. Do not edit files. This directory intentionally contains no project AGENTS.md, .agents, or .codex runtime adapter. Confirm that the global Ultimate Loop routing/skill is active, then sequentially spawn the custom roles with explicit agent_type values devils-advocate, counter-advocate, and reality-verifier using no inherited conversation fork. End exactly with GLOBAL_RUNTIME_PASS only if the skill is active and all three custom roles loaded; otherwise end with GLOBAL_RUNTIME_FAIL or GLOBAL_RUNTIME_BLOCKED and the smallest missing evidence.') | tee "$out"
  after="$(sha256sum "$d/README.md" | awk '{print $1}')"
  [ "$before" = "$after" ] || fail "Smoke repo mutated"
  grep -q 'GLOBAL_RUNTIME_PASS' "$out" || fail "Global runtime smoke did not return GLOBAL_RUNTIME_PASS"
  rm -f "$out"; echo SMOKE_PASS
}

if [ "$ACTION" = status ]; then status; exit 0; fi
if [ "$ACTION" = smoke ]; then smoke; exit 0; fi
if [ "$ACTION" = uninstall ]; then
  say "Removing managed Ultimate Loop runtime"
  rm -rf "$SKILL"; rm -f "$CH/agents/devils-advocate.toml" "$CH/agents/counter-advocate.toml" "$CH/agents/reality-verifier.toml" "$WRAPPER" "$MANIFEST"
  strip_block; echo UNINSTALL_PASS; exit 0
fi
[ "$ACTION" = install ] || fail "Usage: $0 [install|status|smoke|uninstall]"

say "Resolving pinned runtime identity"
if [[ "$REF" =~ ^[0-9a-fA-F]{40}$ ]]; then SHA="$REF"; else
  SHA="$(git ls-remote "$REPO" "refs/heads/$REF" | awk 'NR==1{print $1}')"
  [ -n "$SHA" ] || SHA="$(git ls-remote "$REPO" "refs/tags/$REF" | awk 'NR==1{print $1}')"
fi
[ -n "${SHA:-}" ] || fail "Could not resolve ref $REF"
BASE_REPO="${REPO%.git}"; [[ "$BASE_REPO" == https://github.com/* ]] || fail "Only github.com runtime repositories are supported"
RAW="https://raw.githubusercontent.com/${BASE_REPO#https://github.com/}/$SHA"
printf 'RUNTIME_REF=%s\nRUNTIME_SHA=%s\n' "$REF" "$SHA"

say "Installing/updating official Codex CLI"
mkdir -p "$BIN"; t="$(mktemp)"; curl -fsSL https://chatgpt.com/codex/install.sh -o "$t"
CODEX_NON_INTERACTIVE=1 CODEX_INSTALL_DIR="$BIN" sh "$t"; rm -f "$t"
[ -x "$BIN/codex" ] || fail "Codex installer did not create $BIN/codex"
"$BIN/codex" --version

say "Installing shared Ultimate Loop skill and custom roles"
mkdir -p "$SKILL" "$CH/agents" "$STATE"
if [ ! -e "$CH/config.toml" ]; then printf '# Ultimate Loop installer: user config layer.\n' >"$CH/config.toml"; chmod 0600 "$CH/config.toml"; fi
get(){ t="$(mktemp)"; curl -fsSL "$RAW/$1" -o "$t"; install -m 0644 "$t" "$2"; rm -f "$t"; }
get .agents/skills/ultimate-loop/SKILL.md "$SKILL/SKILL.md"
for r in devils-advocate counter-advocate reality-verifier; do get ".codex/agents/$r.toml" "$CH/agents/$r.toml"; done

say "Installing bounded global /goal adapter"
mkdir -p "$CH"; if [ -f "$GLOBAL" ]; then cp -p "$GLOBAL" "$GLOBAL.bak.$(date -u +%Y%m%dT%H%M%SZ)"; fi
touch "$GLOBAL"; chmod 0600 "$GLOBAL"; strip_block; printf '\n' >>"$GLOBAL"; managed_block >>"$GLOBAL"
[ ! -f "$CH/AGENTS.override.md" ] || printf '\nWARNING: %s exists and overrides %s; verify /goal routing is not suppressed.\n' "$CH/AGENTS.override.md" "$GLOBAL" >&2

say "Installing stable entrypoint"
cat >"$WRAPPER" <<EOF_WRAPPER
#!/usr/bin/env bash
set -euo pipefail
export CODEX_HOME="$CH"
export PATH="$BIN:\$PATH"
if [ "\${1:-}" = --goal ]; then shift; g="\${*:-Run the repository bounded Ultimate Loop and stop only at a real gate.}"; exec "$BIN/codex" exec -C "\$PWD" "/goal

\$g"; fi
exec "$BIN/codex" "\$@"
EOF_WRAPPER
chmod 0755 "$WRAPPER"

cat >"$MANIFEST" <<EOF_MANIFEST
installed=true
runtime_repo=$REPO
runtime_ref=$REF
runtime_sha=$SHA
installed_at_utc=$(date -u +%Y-%m-%dT%H:%M:%SZ)
codex_bin=$BIN/codex
skill=$SKILL/SKILL.md
roles_dir=$CH/agents
global_agents=$GLOBAL
wrapper=$WRAPPER
EOF_MANIFEST
chmod 0600 "$MANIFEST"

say "Smoke checking installed runtime"
grep -q '^name: ultimate-loop$' "$SKILL/SKILL.md" || fail "skill metadata missing"
for r in devils-advocate counter-advocate reality-verifier; do grep -q "^name = \"$r\"$" "$CH/agents/$r.toml" || fail "$r role missing"; done
grep -q ULTIMATE_LOOP_RUNTIME_BEGIN "$GLOBAL" || fail "global routing block missing"
"$WRAPPER" --version >/dev/null
printf '\nINSTALL_PASS\nRuntime SHA: %s\nEntrypoint: %s\nOne-shot: cd /path/to/repo && %s --goal "your goal"\n' "$SHA" "$WRAPPER" "$WRAPPER"
