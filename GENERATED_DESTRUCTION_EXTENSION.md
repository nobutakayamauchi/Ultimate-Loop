# Generated Destruction & Replay Extension — Ultimate Loop

Status: `FINAL ADEQUACY DA CLEARED / MERGE READY / SELF_EVOLVING`

This extension strengthens existing Ultimate Loop responsibilities with generated attacks, replayability, bounded destructive work, controlled hostile-world testing, and conditional formalization.

It does **not** create a fourth loop, a new permanent agent organization, or a dependency on any named external project.

The external challenger sweep and DA lineage are preserved in:

- `EXTERNAL_CHALLENGER_SWEEP_2026-08-17.md`
- `GENERATED_DESTRUCTION_POST_DA.md`
- `EVOLUTION_ADEQUACY_DA_2026-08-17.md`

## Core invariants

```text
IMAGINED ATTACK SET != REACHABLE FAILURE SPACE
FAILURE OBSERVED != FAILURE REPRODUCIBLE
GENERATOR OUTPUT != ORACLE AUTHORITY
MORE SCAFFOLD != MORE CAPABILITY
INTERNAL METEOR PASS != HOSTILE WORLD PASS
PROSE INVARIANT != STATE-SPACE VALIDATED INVARIANT
MODEL CHECK PASS != RUNTIME EVIDENCE
GENERATOR EXHAUSTION != BUG ABSENCE
BOUND EXHAUSTION != CONVERGENCE
SEED != COMPLETE REPLAY PACKET
AFTER FAULT != BECAUSE OF FAULT
NOT_RUN != NOT_APPLICABLE
FILE EXISTS != CANONICAL METHOD INTEGRATED
```

---

# 0. Applicability & Completeness Gate

The evolved mechanisms are not universal rituals. Before promotion, classify each mechanism that could materially affect the frozen workload.

Applicability state:

```text
REQUIRED
OPTIONAL
NOT_APPLICABLE
BLOCKED
```

Execution/result state remains separate:

```text
PASS
FAIL
BOUND_EXHAUSTED
UNEXPLORED
UNKNOWN
```

Rules:

1. `NOT_APPLICABLE` requires a reason tied to the frozen workload.
2. `NOT_RUN != NOT_APPLICABLE`.
3. `BLOCKED != PASS`.
4. A mechanism is not REQUIRED merely because a tool, schema, grammar, state model, or formal notation exists.
5. A REQUIRED mechanism that is `FAIL`, `BLOCKED`, `BOUND_EXHAUSTED`, `UNEXPLORED`, or `UNKNOWN` cannot silently contribute promotion evidence.
6. If the frozen workload explicitly requires that evidence, promotion fails closed until the workload is narrowed by explicit authority or the evidence requirement is satisfied.
7. Applicability decisions are themselves subject to DA / Counter-DA.
8. Optional mechanisms may remain unused without penalty when the frozen workload does not justify their cost or risk.

This gate exists to prevent both failure modes:

```text
RUN EVERYTHING → SIMCITY / COST EXPLOSION
SKIP EVERYTHING OPTIONAL → SILENT UNDER-TESTING
```

`CLASSIFICATION != NEW ORCHESTRATOR`.

---

# 1. Generated Attack Lane — conditional METEOR support

When the frozen workload exposes a useful schema, grammar, property set, state model, API contract, file format, protocol, or operation graph, METEOR may add an attack lane independent from deliberate human/AI attack ideation.

```text
FROZEN WORKLOAD
→ GENERATED ATTACK APPLICABILITY
→ MACHINE-USABLE MODEL / CONTRACT
→ GENERATED VALUES / SEQUENCES
→ EXECUTION
→ ORACLE / PROPERTY CHECK
→ FAILURE CLASSIFICATION
→ SHRINK / MINIMIZE WHEN PRACTICAL
→ REPLAY PACKET
```

Rules:

1. Generated testing supplements DA/METEOR; it does not replace deliberate adversarial reasoning.
2. Generator/tool identity, relevant version/configuration, and input model identity belong to evidence.
3. Stateful sequences are preferred when bugs can arise from operation order rather than isolated inputs.
4. Invalid, boundary, and valid-to-invalid transitions are first-class attack space where the workload permits them.
5. Repeated equivalent cases collapse into a root-cause/failure class where practical; repetition cannot launder itself into perspective novelty.
6. No generated test pass may claim absence of defects.
7. Missing generated coverage remains `UNEXPLORED` / `UNKNOWN`, not PASS.
8. Generated-case count is not a fitness metric by itself.

`GENERATED CASE COUNT != PERSPECTIVE NOVELTY`.

## Oracle / Checker Integrity

Generated inputs are only useful when the expected property is grounded well enough to distinguish a target failure from a bad checker or harness.

A material generated finding should classify as one of:

```text
SYSTEM_FAILURE
ORACLE_FAILURE
HARNESS_FAILURE
UNKNOWN
```

Rules:

- expected properties should bind to an explicit invariant, frozen contract, independently grounded reference behavior, or equivalent source where practical;
- a generator is not promotion authority merely because it can also validate responses;
- if generator and checker share the same material assumption, Counter-DA must challenge that shared assumption before a promotion-critical conclusion is accepted;
- stale schema, invalid preconditions, harness crash, timeout infrastructure failure, or checker mismatch must not be mislabeled as target-system defects;
- differential, metamorphic, mutation, reference-model, or independent-checker techniques may be used as replaceable oracle challengers when justified, but none becomes a mandatory new core lane.

`GENERATOR OUTPUT != ORACLE AUTHORITY`.

## Generated destructive authority

Schema/stateful generation can mutate real state even without a Nemesis fault. Before generated testing that can cause material side effects:

```text
TARGET IDENTITY
+ AUTHORIZED TEST / DOGFOOD BOUNDARY
+ SIDE-EFFECT POLICY
+ DATA CLASSIFICATION
+ RESET / RECOVERY PATH
+ BLAST-RADIUS BOUND
→ GENERATED DESTRUCTION AUTHORIZED
```

Production, third-party, shared, ambiguous, or irreversible targets fail closed unless separately and explicitly authorized.

`GENERATED INPUT AUTHORITY != DESTRUCTIVE TARGET AUTHORITY`.

---

# 2. Replay Packet — cross-cutting evidence contract

Every material destructive finding should preserve enough information to replay the failure when controllable.

Recommended compact replay manifest:

```text
finding_id
workload_id / revision
implementation identity
model/schema/property identity
seed or generated-case identity when present
test/generator configuration
ordered operation history
fault/nemesis history when present
environment / deployment identity when relevant
external source evidence references
expected property
observed violation
minimal/reduced counterexample when available
known nondeterministic remainder
bulk-artifact references / digests when needed
```

Rules:

1. `EXACT REPLAY` may be claimed only inside the deterministic/controlled envelope actually preserved.
2. Seed is one replay input, not replay identity by itself.
3. External provider state, model nondeterminism, network behavior, user-device state, clocks, scheduling, or other uncontrolled variables remain explicit when they prevent exact replay.
4. A minimized counterexample is DERIVED and does not replace original source evidence.
5. A minimized case must reproduce the same classified property violation inside the controllable envelope before becoming the preferred replay case.
6. Replayability does not authorize plaintext secret retention.
7. Prefer safe identifiers, hashes, lengths, redacted forms, secret-store handles, or operator re-entry over copied credentials/tokens/private data.
8. Replay Packet is a compact manifest, not a second raw-log warehouse. Bulk artifacts may be referenced by durable identity/digest from replaceable storage.
9. Missing referenced evidence later must remain visible rather than being treated as successful replayability.

```text
ORIGINAL FAILURE
→ REPLAY PACKET
→ PATCH
→ SAME PACKET REPLAY WHEN POSSIBLE
→ BROADER REGRESSION
```

`FIX WITHOUT FAILED-CASE REPLAY < FIX WITH FAILED-CASE REPLAY`, when the failing case is controllable enough to replay.

---

# 3. Bounded Destruction — cross-cutting resource contract

Any destructive mechanism capable of material self-expansion must have an explicit bound or a declared external stop authority.

This includes, where applicable:

- loop iterations;
- generated cases;
- retries;
- queue depth;
- recursive challenger spawning;
- parallel workstreams;
- wall-clock time;
- token/compute budget;
- external API/tool calls;
- monetary cost;
- retained replay artifacts / storage.

When a bound is reached:

```text
BOUND_EXHAUSTED
→ STOP REASON RECORDED
→ COVERAGE / FRONTIER REMAINS OPEN
→ NO FALSE CONVERGENCE
```

Rules:

- `NO_NEW_PERSPECTIVE != OUT_OF_BUDGET`;
- bound increases are explicit decisions;
- previous exhaustion remains preserved;
- reason for raising the bound is recorded;
- cumulative resource use remains observable when practical;
- repeated bound increases without materially new perspective become a governance/operator finding rather than invisible continuation.

`RAISE BOUND != ERASE EXHAUSTION`.

---

# 4. Anti-scaffold rule — Raison d'être reinforcement, not a new lane

The mini-SWE-agent challenger did not justify another permanent component. It strengthened an existing Raison d'être obligation.

Before adding a permanent agent role, adapter, watcher, control-plane, specialized tool wrapper, or custom service, Raison d'être must consider whether the same frozen responsibility can be satisfied by a simpler existing holder or composition.

Existing canonical order remains primary:

```text
DROP
→ EXTERNALIZE
→ COMPOSE
→ MANUAL_BOUNDED
→ GLUE
→ IRREDUCIBLE_BUILD
```

Useful simple candidates may include ordinary shell/API use, existing tools, prompts/procedures, bounded manual operation, or small glue.

Rules:

- the simpler candidate must satisfy the **same frozen requirements**;
- fewer components do not win if they delete independence, authority separation, evidence quality, reproducibility, safety, recovery, reliability, or other required properties;
- obviously non-viable simple candidates may be rejected by rationale/evidence without fake implementation work;
- candidate ordering is a heuristic, not a mandatory waterfall;
- specialization survives only when it materially earns its cost.

`MORE SCAFFOLD != MORE CAPABILITY`.

`FEWER COMPONENTS != SAME RESPONSIBILITY`.

`SPECIALIZATION MUST BE EARNED`.

---

# 5. External Nemesis Lane — conditional hostile-world testing

When the frozen workload depends materially on external/distributed behavior, METEOR or the Reality Gate may add a separate fault-injection lane that attacks the world around the implementation.

Candidate faults include only those authorized by the workload, for example:

- process restart/crash;
- network interruption/partition/latency;
- dependency timeout/unavailability;
- retry/reordering/duplication;
- storage/read/write failure in a test harness;
- clock disturbance where safely simulated;
- provider partial failure or malformed response through a stub/proxy;
- stale cache or delayed propagation;
- bounded resource exhaustion inside a sandbox.

Before destructive external fault injection:

```text
TARGET IDENTITY
+ AUTHORIZED BOUNDARY
+ BLAST-RADIUS BOUND
+ RECOVERY PATH
→ NEMESIS AUTHORIZED
```

Required evidence separation:

```text
NORMAL WORKLOAD HISTORY
+
NEMESIS / FAULT HISTORY
→ ORDERABLE COMBINED EVIDENCE
→ CHECKER / EXPECTED SAFETY & RECOVERY PROPERTIES
```

Rules:

1. Fault injection requires an explicit test/dogfood/sandbox authority boundary unless separately authorized.
2. No implicit authority exists to attack production, third-party services, shared infrastructure, or ambiguous targets.
3. Fault events remain source evidence distinct from later causal interpretation.
4. Temporal proximity is not causation: `AFTER FAULT != BECAUSE OF FAULT`.
5. Multiple plausible causes preserve CONFLICT/UNKNOWN until discriminated.
6. Normal METEOR success does not imply hostile-world success.
7. Where fault injection is required but impossible, the lane is BLOCKED/UNKNOWN rather than silently passed.

`CONTROLLED CHAOS != UNBOUNDED DAMAGE`.

---

# 6. Formalization Escalation — conditional, not universal

Formal/model-based verification is an escalation challenger, not a default gate.

Consider escalation when one or more survive DA:

- recurring high-severity state-transition bugs;
- concurrency/order/interleaving defects;
- authority transitions difficult to reason about informally;
- recovery/rollback/idempotency behavior with many reachable states;
- the same invariant repeatedly reopens after multiple fixes;
- a compact useful model can represent the disputed property.

Escalation flow:

```text
RECURRING / HIGH-SEVERITY STATE PROBLEM
→ BOUNDED MODEL
→ INVARIANTS / SAFETY / LIVENESS PROPERTY AS APPLICABLE
→ STATE-SPACE / TRACE CHALLENGE
→ COUNTEREXAMPLE TRACE
→ MAP BACK TO REAL IMPLEMENTATION
→ IMPLEMENTATION FIX / TEST
→ REALITY EVIDENCE STILL REQUIRED
```

Required model-check evidence includes, where available:

- model/spec revision;
- checker/tool identity;
- relevant constants/configuration;
- assumptions/reduced domains/symmetry settings;
- explored or limited state-space evidence;
- stop/result reason;
- counterexample trace when present;
- explicit mapping boundary to implementation/test/deployment surfaces.

Rules:

1. No formal tool is mandatory by name.
2. A model may be wrong or incomplete; assumptions are evidence boundaries.
3. `MODEL RUN ENDED != STATE SPACE EXHAUSTED`.
4. Resource-limited/incomplete checking cannot masquerade as a proof-like pass.
5. Model-check success proves only the checked model/property/configuration scope.
6. If the model-to-implementation mapping becomes stale, the result remains design evidence rather than current implementation evidence.
7. Counterexample traces are valuable attack/replay inputs.
8. Formal verification never substitutes for Git integration evidence, deployment identity, provider evidence, device evidence, or other real-world gates.

`FORMAL MODEL != WORLD`.

---

# Interaction with TRACE

TRACE remains observer, not governor.

When attached and supported by its current schema/profile, useful material evidence may include:

- applicability decisions and reasons;
- generated attack start/stop;
- generator/model/config identity;
- case/seed identity;
- oracle/harness/system classification;
- target authorization boundary where material;
- operation sequence;
- minimized counterexample linkage;
- replay packet identity/result;
- destruction-bound configuration/exhaustion/raise decisions;
- nemesis/fault events;
- model-check run identity/stop reason/counterexample reference;
- human decisions that change authority or bounds.

If TRACE cannot represent a material event faithfully, that is an observer capability gap.

`OBSERVER SCHEMA GAP != EVENT DID NOT HAPPEN`.

If the frozen workload makes auditability mandatory, an unrepresentable required event may block that auditability claim. Otherwise Ultimate Loop remains operable with degraded reconstructability explicitly recorded.

---

# Interaction with convergence and promotion

Generated attacks, replay attempts, and nemesis faults may produce many superficially distinct events.

Convergence operates on materially distinct perspectives/root causes, not raw case count.

Useful distinctions:

- new case / same root cause;
- new root cause / known perspective;
- genuinely new perspective;
- false positive / oracle failure / harness failure;
- untested because NOT_APPLICABLE;
- untested because BLOCKED;
- stopped by BOUND_EXHAUSTED;
- blocked by external evidence boundary.

A practical classification may consider:

```text
NOVELTY × SEVERITY × INDEPENDENCE × ACTIONABILITY
```

but no score is mandatory.

`CONVERGED_UNDER_CURRENT_SCOPE` means no materially new perspective survives inside the completed authorized scope.

It does **not** by itself mean `PROMOTION_READY`.

Promotion still requires the frozen evidence/authority/reality requirements of the canonical method to be satisfied.

---

# Normalized architecture after final adequacy DA

```text
ULTIMATE LOOP CORE
├─ existing Raison d'être
│  └─ strengthened anti-scaffold rule
├─ existing deliberate DA / METEOR
│  └─ conditional Generated Attack Lane
├─ cross-cutting Replay Packet contract
├─ cross-cutting Bounded Destruction contract
├─ conditional External Nemesis Lane
├─ conditional Formalization Escalation
└─ small Applicability & Completeness classification
```

No new permanent agent role is required.

All concrete tools remain replaceable occupants.

---

# Acceptance gate

This extension may be promoted only if all remain true:

- no named external repository is required for Ultimate Loop operation;
- applicability can distinguish REQUIRED/OPTIONAL/NOT_APPLICABLE/BLOCKED;
- generated testing cannot masquerade as correctness proof;
- oracle/harness failure can be distinguished from target-system failure or left UNKNOWN;
- stateful generated destruction has explicit target/side-effect/recovery authority;
- replay defaults to a secret-safe compact manifest;
- exact replay is claimed only inside the captured deterministic envelope;
- seed alone is not treated as complete replay identity;
- destructive expansion is bounded or explicitly externally stopped;
- budget exhaustion cannot masquerade as convergence;
- anti-scaffold minimality cannot delete necessary independence/safety requirements;
- external fault injection is constrained to explicit authorized targets;
- fault chronology cannot masquerade as causation;
- formal checks preserve scope/stop reason and remain distinct from runtime evidence;
- TRACE remains observer, not authority;
- the canonical `METHOD.md` references this extension.

If any fails, return the extension to DA rather than weakening the invariant.
