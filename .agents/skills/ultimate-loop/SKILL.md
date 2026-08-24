---
name: ultimate-loop
description: Run the repository's Ultimate Loop end-to-end for /goal requests: freeze the workload, refresh current reality, destroy unnecessary work, challenge the surviving design, implement the smallest survivor, verify reality, gate material external exposure/security, and preserve evidence/lineage without inventing success.
---

# Ultimate Loop

Use this skill when the user writes `/goal`, explicitly asks to run Ultimate Loop, or asks Codex to push a development goal as far as safely and evidentially possible.

## Operating rule

Keep going through mechanical steps. Stop only at a true Human Gate, missing permission/credential, unavailable required external evidence, destructive action outside authority, or an irreducible ambiguity that changes the frozen workload.

Do not create work merely to demonstrate activity. The first candidate is always "do less / reuse / compose / bounded manual".

## Phase 0 — Freeze the subject

Write down, in the working notes or visible response, the minimum frozen contract:

- human-important outcome;
- current problem/event;
- in-scope workload and explicit non-goals;
- success evidence;
- authority and destructive-action limits;
- exposure/privacy constraints;
- untrusted/external surface and protected assets when material;
- runtime/equivalent verification boundary;
- cost/time/tool bounds when material.

If the user already supplied these, reuse them instead of asking again.

## Phase 1 — Current discovery

Refresh the current implementation landscape before claiming superiority. Prefer official docs, current repository state, package/service metadata, and direct runtime evidence.

Classify findings as source evidence vs derived interpretation. Preserve stale/unknown boundaries explicitly.

`NO CURRENT LANDSCAPE SWEEP -> NO SUPERIORITY CLAIM`

## Phase 2 — Raison d'être Destroy

Attack the responsibility before implementing it.

Try, in order as applicable:

`DROP -> EXTERNALIZE -> COMPOSE -> MANUAL_BOUNDED -> GLUE -> IRREDUCIBLE_BUILD`

Before adding a permanent agent, wrapper, watcher, adapter, control plane, database, daemon, or service, prove why a simpler holder cannot satisfy the same frozen requirements.

For material architecture decisions, spawn the project role `devils-advocate` explicitly through the runtime's role/agent-type field and ask it for the strongest case against the proposal. Then spawn `counter-advocate` explicitly against those findings. A task name that merely resembles a role does not prove the custom role was applied. The parent session adjudicates from evidence; subagents do not decide.

If the responsibility dies here, record the reason and stop building it.

## Phase 3 — Bounded candidates / METEOR

Materialize the strongest simple/external composition and the smallest justified custom challenger when a real gap survives.

Compare against the same frozen workload. Relevant dimensions may include capability, quality, reliability, security/privacy, operator burden, maintenance, cost, migration/rollback, dependency risk, recoverability, evidence maturity, and PHOENIX implications.

A candidate cannot win by deleting inherited safety, durability, evidence, authority, or recovery requirements.

Possible result:

`KEEP / PARTIAL_REPLACE / FULL_REPLACE / STANDBY / REJECT`

## Phase 4 — Implement the survivor

Make the smallest coherent change that implements the surviving responsibility.

Rules:

- inspect before editing;
- preserve unrelated behavior;
- prefer existing project conventions;
- add or update tests/evidence where the workload requires them;
- do not expose secrets or protected commercial internals;
- do not treat a new file/agent/abstraction as progress unless it reduces whole-life burden or satisfies a frozen requirement.

When parallel work is useful, split only independent workstreams. Avoid multiple agents editing the same state concurrently unless the merge boundary is explicit.

If the surviving change targets `.agents/` or `.codex/` and the current Codex client protects those paths, treat the refusal as an explicit self-modification permission boundary. Do not jump to unrestricted permissions merely to continue. Use only a separately authorized write mechanism or explicit approval, then verify the newly loaded configuration in a fresh context when required.

## Phase 5 — Destruction and verification

Run applicable tests and destructive/replay checks under explicit bounds.

Classify each applicable evidence mode separately:

Applicability: `REQUIRED / OPTIONAL / NOT_APPLICABLE / BLOCKED`

Result: `PASS / FAIL / BOUND_EXHAUSTED / UNEXPLORED / UNKNOWN`

Use the project role `reality-verifier` explicitly for an independent check of material completion claims. The role's prompt-level non-mutation instruction is not evidence that the live process was technically unable to write.

For a material specialist verdict where independence matters:

1. complete all parent writes first;
2. capture a baseline repository/worktree state sufficient to detect changes;
3. prohibit concurrent parent/sibling writes during specialist evaluation;
4. establish a proven technical write boundary — a functioning read-only sandbox, an OS-level read-only checkout under a non-privileged account, or equivalent enforcement;
5. run the specialist only after that boundary is established;
6. capture repository/worktree state after the specialist returns;
7. invalidate the specialist verdict if state mutated or the technical boundary cannot be established.

`PROMPT NON-MUTATION != TECHNICAL READ-ONLY`

A clean before/after fingerprint is useful evidence but does not alone prove the process lacked write capability. A contaminated or technically unbounded verifier result is not promotion evidence.

For deployed/runtime surfaces, establish deployment identity before treating probes as evidence. After a fix, re-establish identity and replay the exact failed probe plus regression checks.

## Phase 6 — Exposure / publication

If monetization, external onboarding, production/Beta distribution, proprietary reusable assets, protected user data, licensing, or security-sensitive internals became material, run `EXPOSURE_GATE.md`.

Do not mutate repository visibility merely because a warning exists. `PUBLIC / SPLIT / PRIVATE` is a Human Gate unless explicit authority already exists.

## Phase 7 — Security release boundary

If the survivor becomes internet-reachable or otherwise accepts untrusted actors/input, touches protected data, uses privileged secrets/tools, gives an AI/agent authority over protected side effects, or exposes externally triggerable paid/scarce operations, run `SECURITY_RELEASE_GATE.md` before representing the candidate as release-ready.

Classify the eight control families independently:

1. authorization and isolation;
2. secrets and credentials;
3. dependencies and supply chain;
4. untrusted input / injection / unsafe output handling;
5. AI prompt injection / agency boundary;
6. abuse / rate / cost / resource bounds;
7. security logging / incident reconstruction;
8. vulnerability freshness / response path.

For each family record applicability (`REQUIRED / OPTIONAL / NOT_APPLICABLE / BLOCKED`) and evidence result (`PASS / FAIL / UNKNOWN / UNEXPLORED`).

Do not promote a REQUIRED `UNKNOWN`, `UNEXPLORED`, or `BLOCKED` control to pass by inference. The gate outcome is one of:

`SECURITY_RELEASE_READY / SECURITY_RELEASE_BLOCKED / EXPLICIT_RISK_ACCEPTANCE_REQUIRED`

Explicit risk acceptance is a Human Gate. It must identify the exact residual risk, affected surface/assets, mitigation, disable/rollback/revoke path, and review trigger.

Bind security evidence to the exact release candidate. A scanner result, AI security prompt, or old SHA/configuration is scoped evidence only.

Reuse the existing `devils-advocate` and `reality-verifier` roles for security-focused adversarial review before inventing a permanent new security-agent role.

Hard reminders:

`WORKS != SAFE_TO_EXPOSE`

`AUTHENTICATED != AUTHORIZED`

`TOOL_RETURNED_ZERO != CONTROL_PROVEN`

`SYSTEM_PROMPT != SECURITY_BOUNDARY`

`OLD_SECURITY_PASS != CURRENT_CANDIDATE_PASS`

## Phase 8 — Evidence, TRACE, lineage

Preserve material transitions when useful:

- goal/workload frozen;
- findings opened/rejected/resolved;
- DA and Counter-DA outcomes;
- invariants/tests added;
- changes/commits/PRs;
- security-release applicability/results and Human risk acceptance when applicable;
- deployment identity and runtime probes;
- human decisions/overrides;
- UNKNOWN/CONFLICT/external-evidence boundaries.

Do not claim hidden chain-of-thought as evidence. TRACE is an observer, never governor.

If a promoted occupant replaces another, preserve enough predecessor/failure/recovery memory for LINEAGE/PHOENIX continuity.

## Phase 9 — Finish or reopen

A run may finish when the current bounded goal has a surviving occupant and all required evidence is satisfied, or when the correct result is DROP/KEEP/blocked Human Gate/explicit UNKNOWN.

Report:

- survivor / decision;
- implementation changes;
- verification evidence;
- Security Release Gate outcome when applicable;
- unresolved UNKNOWN/CONFLICT or blocked gate;
- next material trigger for WATCH/DARWIN.

Do not invent another task just to keep the loop spinning. `STABLE` means stable-by-default until a material trigger appears.
