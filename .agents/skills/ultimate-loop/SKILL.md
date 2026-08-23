---
name: ultimate-loop
description: Run the repository's Ultimate Loop end-to-end for /goal requests: freeze the workload, refresh current reality, destroy unnecessary work, challenge the surviving design, implement the smallest survivor, verify reality, and preserve evidence/lineage without inventing success.
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

For material architecture decisions, ask the `devils-advocate` subagent for the strongest case against the proposal. Then ask `counter-advocate` to attack those findings. The parent session adjudicates from evidence; subagents do not decide.

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

Use `reality-verifier` for an independent check of material completion claims. Its custom configuration requests `sandbox_mode = "read-only"`, but that request is not itself evidence that the spawned runtime was technically unable to write because live parent permission overrides may be inherited.

For a material specialist verdict where independence matters:

1. complete all parent writes first;
2. capture a baseline repository/worktree state sufficient to detect changes;
3. prohibit concurrent parent/sibling writes during specialist evaluation;
4. use the narrowest available runtime permission, preferably an explicit read-only run/session when supported;
5. capture repository/worktree state after the specialist returns;
6. invalidate the specialist verdict if it mutated candidate state or if the mutation boundary cannot be established.

`READ_ONLY REQUESTED != READ_ONLY PROVEN`

A contaminated verifier result is not PASS. Return the finding to the parent implementer, restore/review the changed state, then verify again from a clean baseline.

For deployed/runtime surfaces, establish deployment identity before treating probes as evidence. After a fix, re-establish identity and replay the exact failed probe plus regression checks.

## Phase 6 — Exposure / publication

If monetization, external onboarding, production/Beta distribution, proprietary reusable assets, protected user data, licensing, or security-sensitive internals became material, run `EXPOSURE_GATE.md`.

Do not mutate repository visibility merely because a warning exists. `PUBLIC / SPLIT / PRIVATE` is a Human Gate unless explicit authority already exists.

## Phase 7 — Evidence, TRACE, lineage

Preserve material transitions when useful:

- goal/workload frozen;
- findings opened/rejected/resolved;
- DA and Counter-DA outcomes;
- invariants/tests added;
- changes/commits/PRs;
- deployment identity and runtime probes;
- human decisions/overrides;
- UNKNOWN/CONFLICT/external-evidence boundaries.

Do not claim hidden chain-of-thought as evidence. TRACE is an observer, never governor.

If a promoted occupant replaces another, preserve enough predecessor/failure/recovery memory for LINEAGE/PHOENIX continuity.

## Phase 8 — Finish or reopen

A run may finish when the current bounded goal has a surviving occupant and all required evidence is satisfied, or when the correct result is DROP/KEEP/blocked Human Gate/explicit UNKNOWN.

Report:

- survivor / decision;
- implementation changes;
- verification evidence;
- unresolved UNKNOWN/CONFLICT or blocked gate;
- next material trigger for WATCH/DARWIN.

Do not invent another task just to keep the loop spinning. `STABLE` means stable-by-default until a material trigger appears.