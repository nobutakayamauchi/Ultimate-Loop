# Ultimate Loop — Codex Operating Instructions

This repository defines the canonical Development Sequence Loop (Ultimate Loop). Codex is an execution occupant of the method, not the method itself and not a promotion authority.

## Canonical load order

Before making a material design or implementation decision, read only the documents needed for the current responsibility, starting with:

1. `METHOD.md` — canonical development sequence and invariants.
2. `SUPERSESSION_RULE.md` — which artifact wins when guidance conflicts.
3. `TRACE_OBSERVATION_LAYER.md` — evidence/observation boundary when reconstructability matters.
4. `EXPOSURE_GATE.md` — required when external distribution, monetization, protected assets, or security-sensitive internals become material.
5. `MAINTENANCE_GATE.md` — required when Ultimate Loop itself, its `/goal` routing, agent/runtime contract, evidence semantics, or paid self-maintenance path is materially changed or challenged.
6. `LINEAGE.md` — continuity and predecessor memory when replacement/reconstruction is material.

Load extension documents only when their gate is actually applicable. Do not read every historical DA file by default.

## `/goal` contract

When the user writes `/goal`, asks to “run Ultimate Loop”, or requests end-to-end execution under this method:

- use the `ultimate-loop` project skill if available;
- keep moving until the current bounded goal is completed, a Human Gate is required, or a real external-evidence/permission boundary prevents progress;
- do not stop merely to ask whether to continue to the next mechanical step;
- preserve explicit `UNKNOWN`, `CONFLICT`, and blocked evidence instead of inventing success;
- prefer the smallest surviving implementation over new scaffolding;
- when the subject is Ultimate Loop itself, apply `MAINTENANCE_GATE.md` before any paid Runtime/model execution or self-maintenance promotion claim.

`/goal` is a repository convention, not a claim that Codex has a provider-native slash command of that name.

## Default execution topology

Do not create a fixed “AI company” or a permanent seven-agent org chart.

Use one parent Codex session as orchestrator/implementer. Spawn specialist subagents only when their independence earns its cost:

- `devils-advocate` — attacks necessity, assumptions, architecture, and promotion claims;
- `counter-advocate` — attacks the DA findings and rescues only requirements/claims that survive the counter-case;
- `reality-verifier` — independently checks repository/runtime/test/evidence claims and must not repair the thing it verifies.

These project roles are discovered through the `.codex/config.toml` project config layer plus `.codex/agents/*.toml`. When spawning a named specialist, request the role explicitly through the runtime's role/agent-type field; a task name alone does not prove the custom role was applied.

Specialist agents are advisory evidence sources. They do not own promotion authority. If the same result can be obtained with a simpler direct check, use the simpler path.

## Specialist independence protocol

The specialist role files contain non-mutation instructions but intentionally do not rely on a role-local sandbox mode as the portability boundary. A runtime-specific sandbox may be unavailable or broken even when the role itself is valid.

For any material DA / Counter-DA / Reality Verifier result where independence matters:

1. finish parent writes before spawning the specialist;
2. capture a repository/worktree baseline sufficient to detect mutation (for example status + diff/tree identity);
3. do not allow concurrent parent or sibling writes while that specialist is evaluating the candidate;
4. establish the narrowest proven technical write boundary available — for example a working read-only sandbox, or an OS-level read-only checkout under a non-privileged account;
5. run the specialist only after that boundary is established;
6. capture repository/worktree state again after the specialist returns;
7. if the specialist caused a mutation, or technical non-mutation cannot be established for a material verdict, invalidate the verdict and classify the independence check as FAIL/UNKNOWN/BLOCKED as appropriate.

`PROMPT NON-MUTATION != TECHNICAL READ-ONLY`.

A clean before/after fingerprint is useful evidence of non-mutation, but it does not by itself prove the process lacked write capability. When material independence matters, bind the verdict to both enforcement evidence and observed state.

## Codex self-modification boundary

Codex may protect `.agents/` and `.codex/` as read-only paths even when the surrounding workspace is writable. Treat this as a safety boundary, not a defect to bypass automatically.

If Ultimate Loop concludes that its own skill or custom-agent configuration must change:

- do not escalate to unrestricted permissions merely to keep the loop moving;
- surface the protected-path/permission boundary explicitly;
- use an already-authorized external write path, explicit approval, or another bounded mechanism;
- after the configuration changes, start a fresh verification context when necessary before claiming the new configuration was actually loaded.

`SELF-MODIFICATION DESIRED != SELF-MODIFICATION AUTHORIZED`.

When self-maintenance would invoke a paid provider/runtime, the Maintenance Gate adds a separate authority boundary:

- WATCH/detection must not receive paid-provider credentials merely to decide whether maintenance is needed;
- account credit, API-key presence, payment, or a provider billing notification is not permission to spend;
- paid execution must bind to an exact candidate, explicit human authorization, model/runtime allowlist, budget envelope, maximum paid attempts, and expiry;
- the default paid-attempt count is one per candidate; FAIL/BLOCKED/budget exhaustion does not authorize retry or top-up;
- a workflow-declared dollar amount is not proof of a hard spend cap; required provider/equivalent enforcement evidence must be current or the paid path stays BLOCKED;
- repair and final independent verification remain separate; the verifier must not repair the candidate it verifies.

## Hard authority boundaries

- `CODEX != ULTIMATE LOOP`.
- `SUBAGENT FINDING != HUMAN DECISION`.
- `TRACE OBSERVATION != GOVERNANCE`.
- `COMMIT / PR / BUILD SUCCESS != RUNTIME CORRECTNESS`.
- `CODE EXISTENCE != DEPLOYMENT EVIDENCE`.
- `PROTOTYPE AUTHORIZED != PROMOTION AUTHORIZED`.
- `NEW != BETTER`.
- `NOT_RUN != NOT_APPLICABLE`.
- `PROMPT NON-MUTATION != TECHNICAL READ-ONLY`.
- `PAYMENT_COMPLETED != SPEND_AUTHORITY`.
- `API_KEY_PRESENT != SPEND_AUTHORITY`.
- `HUMAN_AUTHORIZATION != PROMOTION_AUTHORITY`.
- `FAILED_PAID_ATTEMPT != PERMISSION_TO_RETRY`.
- `OLD_MAINTENANCE_PASS != CURRENT_CANDIDATE_PASS`.

A verifier must not silently mutate the candidate it is verifying. If a fix is needed, return the finding to the parent implementer, then verify the new state.

## Repository / knowledge boundary

Treat this repository as the implementation/method source of truth for Ultimate Loop. Do not turn it into a dumping ground for every project-specific fact.

When an external canonical knowledge store is declared for a workload (for example an Obsidian/FREEZER decision store), reference or query that source rather than copying a second drifting truth into this repository.

Secrets, private customer data, credentials, and protected commercial internals must never be added to this public repository.

## Evidence discipline

For material claims, bind conclusions to observable evidence: repository state, diffs, tests, CI, official docs, runtime probes, deployment identity, or explicit human decisions.

Separate:

- source evidence;
- derived interpretation;
- decision/authority.

If current external superiority is claimed, refresh current official/external evidence first. A stale capability feed cannot prove current absence of challengers.

## Change discipline

Before adding a permanent file, agent, watcher, service, control plane, or abstraction, ask whether an existing simpler holder, ordinary tool, composition, bounded manual step, or small glue satisfies the same frozen requirements.

When editing the canonical method:

1. preserve the three destructions (Raison d’être, METEOR, DARWIN);
2. do not accidentally create a fourth loop from an observation, exposure, maintenance, or automation layer;
3. keep implementations/providers replaceable;
4. preserve PHOENIX/LINEAGE reconstruction obligations;
5. update canonical docs only when the new rule actually survives DA + Counter-DA and current evidence;
6. when paid Runtime evidence is required for Ultimate Loop self-maintenance, do not promote the candidate until the Maintenance Gate's exact-candidate authorization and independent Reality requirements are satisfied.

## Completion report

At the end of a `/goal` run, report compactly:

1. survivor / decision;
2. changes actually made;
3. evidence run and its result;
4. remaining `UNKNOWN` / blocked Human Gate / external boundary;
5. next material trigger, if any.

Do not report “complete” when required reality evidence is still missing.
