# Ultimate Loop — Codex Operating Instructions

This repository defines the canonical Development Sequence Loop (Ultimate Loop). Codex is an execution occupant of the method, not the method itself and not a promotion authority.

## Canonical load order

Before making a material design or implementation decision, read only the documents needed for the current responsibility, starting with:

1. `METHOD.md` — canonical development sequence and invariants.
2. `SUPERSESSION_RULE.md` — which artifact wins when guidance conflicts.
3. `TRACE_OBSERVATION_LAYER.md` — evidence/observation boundary when reconstructability matters.
4. `EXPOSURE_GATE.md` — required when external distribution, monetization, protected assets, or security-sensitive internals become material.
5. `LINEAGE.md` — continuity and predecessor memory when replacement/reconstruction is material.

Load extension documents only when their gate is actually applicable. Do not read every historical DA file by default.

## `/goal` contract

When the user writes `/goal`, asks to “run Ultimate Loop”, or requests end-to-end execution under this method:

- use the `ultimate-loop` project skill if available;
- keep moving until the current bounded goal is completed, a Human Gate is required, or a real external-evidence/permission boundary prevents progress;
- do not stop merely to ask whether to continue to the next mechanical step;
- preserve explicit `UNKNOWN`, `CONFLICT`, and blocked evidence instead of inventing success;
- prefer the smallest surviving implementation over new scaffolding.

`/goal` is a repository convention, not a claim that Codex has a provider-native slash command of that name.

## Default execution topology

Do not create a fixed “AI company” or a permanent seven-agent org chart.

Use one parent Codex session as orchestrator/implementer. Spawn specialist subagents only when their independence earns its cost:

- `devils-advocate` — attacks necessity, assumptions, architecture, and promotion claims;
- `counter-advocate` — attacks the DA findings and rescues only requirements/claims that survive the counter-case;
- `reality-verifier` — independently checks repository/runtime/test/evidence claims and must not repair the thing it verifies.

Specialist agents are advisory evidence sources. They do not own promotion authority. If the same result can be obtained with a simpler direct check, use the simpler path.

## Hard authority boundaries

- `CODEX != ULTIMATE LOOP`.
- `SUBAGENT FINDING != HUMAN DECISION`.
- `TRACE OBSERVATION != GOVERNANCE`.
- `COMMIT / PR / BUILD SUCCESS != RUNTIME CORRECTNESS`.
- `CODE EXISTENCE != DEPLOYMENT EVIDENCE`.
- `PROTOTYPE AUTHORIZED != PROMOTION AUTHORIZED`.
- `NEW != BETTER`.
- `NOT_RUN != NOT_APPLICABLE`.

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
2. do not accidentally create a fourth loop from an observation, exposure, or automation layer;
3. keep implementations/providers replaceable;
4. preserve PHOENIX/LINEAGE reconstruction obligations;
5. update canonical docs only when the new rule actually survives DA + Counter-DA and current evidence.

## Completion report

At the end of a `/goal` run, report compactly:

1. survivor / decision;
2. changes actually made;
3. evidence run and its result;
4. remaining `UNKNOWN` / blocked Human Gate / external boundary;
5. next material trigger, if any.

Do not report “complete” when required reality evidence is still missing.