#!/usr/bin/env bash
set -euo pipefail

UL_BIN="${ULTIMATE_LOOP_CODEX_BIN:-$HOME/.local/bin/ultimate-loop-codex}"
ROOT="/tmp/ultimate-loop-adapter-dogfood-$(date -u +%Y%m%dT%H%M%SZ)"
mkdir -p "$ROOT"

say(){ printf '\n=== %s ===\n' "$*"; }
fail(){ printf '\nADAPTER_DOGFOOD_FAIL: %s\n' "$*" >&2; exit 1; }
[ -x "$UL_BIN" ] || fail "shared runtime entrypoint missing: $UL_BIN"
command -v git >/dev/null || fail "git is required"
command -v sudo >/dev/null || fail "sudo is required for the OS read-only boundary"

cleanup(){ sudo rm -rf "$ROOT" >/dev/null 2>&1 || true; }
trap cleanup EXIT

clone_repo(){
  local repo="$1" branch="$2" dir="$3"
  rm -rf "$dir"
  if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    gh repo clone "$repo" "$dir" -- --depth 1 --single-branch --branch "$branch" && return 0
    rm -rf "$dir"
  fi
  if GIT_SSH_COMMAND='ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new' git clone --depth 1 --single-branch --branch "$branch" "git@github.com:${repo}.git" "$dir"; then return 0; fi
  rm -rf "$dir"
  if GIT_TERMINAL_PROMPT=0 git clone --depth 1 --single-branch --branch "$branch" "https://github.com/${repo}.git" "$dir"; then return 0; fi
  rm -rf "$dir"
  return 1
}

git_ro(){
  local dir="$1"; shift
  env GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0="$dir" GIT_OPTIONAL_LOCKS=0 git -C "$dir" "$@"
}

run_one(){
  local name="$1" repo="$2" branch="$3" marker="$4" prompt="$5"
  local dir="$ROOT/$name" out="$ROOT/$name.log" before after status rc
  say "$name clone $repo@$branch"
  clone_repo "$repo" "$branch" "$dir" || fail "$name clone blocked; Oracle needs GitHub access for $repo"
  before="$(git -C "$dir" rev-parse HEAD)"

  say "$name establish OS read-only candidate"
  sudo chown -R root:root "$dir"
  sudo find "$dir" -type d -exec chmod 0555 {} +
  sudo find "$dir" -type f -exec chmod 0444 {} +
  [ ! -w "$dir/AGENTS.md" ] || fail "$name AGENTS.md is still writable by runtime identity"
  if ( printf x >"$dir/.ultimate-loop-write-probe" ) 2>/dev/null; then
    fail "$name write probe unexpectedly succeeded"
  fi
  printf '%s_OS_WRITE_PROBE=PASS_WRITE_DENIED\n' "$name"

  say "$name shared /goal smoke"
  set +e
  (
    cd "$dir"
    env GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0="$dir" GIT_OPTIONAL_LOCKS=0 "$UL_BIN" --goal "$prompt"
  ) | tee "$out"
  rc=${PIPESTATUS[0]}
  set -e
  [ "$rc" -eq 0 ] || fail "$name Codex exited $rc"
  grep -Fxq "$marker" "$out" || fail "$name did not emit exact $marker"

  after="$(git_ro "$dir" rev-parse HEAD)"
  status="$(git_ro "$dir" status --porcelain=v1 --untracked-files=all)"
  [ "$before" = "$after" ] || fail "$name HEAD changed: $before -> $after"
  [ -z "$status" ] || fail "$name repository state changed: $status"
  printf '%s_HEAD=%s\n%s_MUTATION_EVIDENCE=CLEAN\n%s\n' "$name" "$after" "$name" "$marker"
}

run_one \
  WEB_AI \
  nobutakayamauchi/WebAI-Bridge-Core \
  codex/ultimate-loop-adapter-v1 \
  WEB_AI_ADAPTER_PASS \
  'Adapter smoke only; do not edit. Use the shared Ultimate Loop runtime for this /goal. Read repository-local AGENTS.md and the smallest canonical boundary documents needed. Validate that WebAI-Bridge-Core remains the canonical private closed-core target, that public export still requires the repository Exposure/allowlist boundary, and that /goal does not weaken deployment-identity or runtime-evidence requirements. Do not perform implementation. End with an exact line WEB_AI_ADAPTER_PASS only if those repo-local boundaries survive the shared runtime; otherwise end with WEB_AI_ADAPTER_FAIL or WEB_AI_ADAPTER_BLOCKED.'

run_one \
  SDN \
  nobutakayamauchi/Sales-Distribution-Network \
  codex/ultimate-loop-adapter-v1 \
  SDN_ADAPTER_PASS \
  'Adapter smoke only; do not edit. Use the shared Ultimate Loop runtime for this /goal. Read repository-local AGENTS.md, README.md, docs/spec/FROZEN_SPEC_V0_5.md, and docs/GOAL_V1.md as needed. Validate that V1 is the authorized BUILD NOW workload, V2+ is not automatically unfrozen, demand signals do not grant Seller authority, and open Reality gates cannot be bypassed. Do not perform implementation. End with an exact line SDN_ADAPTER_PASS only if those frozen boundaries survive the shared runtime; otherwise end with SDN_ADAPTER_FAIL or SDN_ADAPTER_BLOCKED.'

run_one \
  RTS \
  nobutakayamauchi/RTS \
  codex/ultimate-loop-adapter-v1 \
  RTS_ADAPTER_PASS \
  'Adapter smoke only; do not edit. Use the shared Ultimate Loop runtime for this /goal. Read repository-local AGENTS.md, docs/CANONICAL_INDEX.md, and the closure records it requires. Validate that RTS remains FROZEN / ENDED by default, /goal does not restart development, and in the absence of explicit human reopening authority the correct result is KEEP/FROZEN/NO-CHANGE rather than invented implementation work. End with an exact line RTS_ADAPTER_PASS only if the repository freeze overrides generic global runtime behavior; otherwise end with RTS_ADAPTER_FAIL or RTS_ADAPTER_BLOCKED.'

printf '\nALL_ADAPTERS_PASS\n'
