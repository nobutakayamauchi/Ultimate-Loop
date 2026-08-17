# Generated Destruction Extension — Ultimate Loop

Status: `CANONICAL EXTENSION CANDIDATE / DA-CLEARED / SELF-EVOLVING`

This extension adds generated attacks, replayability, bounded destructive work, minimal-scaffold competition, controlled external fault injection, and conditional formalization to Ultimate Loop.

It does not create a fourth loop.

It extends Raison d'être, METEOR, Reality Gate, TRACE-compatible evidence, and DARWIN with additional challenger classes.

## Core invariants

```text
IMAGINED ATTACK SET != REACHABLE FAILURE SPACE
FAILURE OBSERVED != FAILURE REPRODUCIBLE
MORE SCAFFOLD != MORE CAPABILITY
INTERNAL METEOR PASS != HOSTILE WORLD PASS
PROSE INVARIANT != STATE-SPACE VALIDATED INVARIANT
MODEL CHECK PASS != RUNTIME EVIDENCE
GENERATOR EXHAUSTION != BUG ABSENCE
BOUND EXHAUSTION != CONVERGENCE
```

---

## 1. Generated Attack Lane

When the frozen workload exposes a useful schema, grammar, property set, state model, API contract, file format, protocol, or operation graph, METEOR SHOULD include a generated attack lane independent from deliberate human/AI attack ideation.

```text
FROZEN WORKLOAD
→ MACHINE-USABLE MODEL AVAILABLE?
  → NO: continue deliberate METEOR
  → YES:
      MODEL / SCHEMA / GRAMMAR / PROPERTIES
      → GENERATED VALUES / SEQUENCES
      → EXECUTION
      → PROPERTY / CONTRACT CHECK
      → FAILURE CLASSIFICATION
      → SHRINK / MINIMIZE WHEN PRACTICAL
      → REPLAY PACKET
```

Rules:

1. Generated testing supplements DA/METEOR; it does not replace deliberate adversarial reasoning.
2. Generator/tool identity, relevant version/configuration, and input model identity belong to evidence.
3. Stateful sequences are preferred when bugs can arise from operation order rather than isolated inputs.
4. Invalid, boundary, and valid-to-invalid transitions are first-class attack space where the workload permits them.
5. Repeated equivalent cases SHOULD collapse into a root-cause/failure class rather than laundering repetition into novelty.
6. No generated test pass may claim absence of defects.
7. Missing generator coverage remains UNKNOWN / UNEXPLORED, not PASS.

`GENERATED CASE COUNT != PERSPECTIVE NOVELTY`

---

## 2. Replay Packet

Every material destructive finding SHOULD produce enough surviving information to replay the failure when controllable.

Recommended replay packet:

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
```

Rules:

- `EXACT REPLAY` may be claimed only inside the deterministic/controlled envelope actually preserved.
- External provider state, model nondeterminism, network behavior, user-device state, clocks, or other uncontrolled variables must remain explicit when they prevent exact replay.
- A minimized counterexample does not replace the original evidence; it becomes a derived/replay artifact linked to it.
- A fix is stronger when the exact failing packet can be replayed before regression.

```text
ORIGINAL FAILURE
→ REPLAY PACKET
→ PATCH
→ SAME PACKET REPLAY
→ BROADER REGRESSION
```

`FIX WITHOUT FAILED-CASE REPLAY < FIX WITH FAILED-CASE REPLAY`

---

## 3. Bounded Destruction

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

A bound may be workload-specific and may be raised by explicit authority.

When a bound is reached:

```text
BOUND EXHAUSTED
→ STOP REASON RECORDED
→ COVERAGE / FRONTIER REMAINS OPEN
→ NO FALSE CONVERGENCE
```

A loop that stops because no materially new perspective survives is different from a loop that stops because resources were exhausted.

`NO_NEW_PERSPECTIVE != OUT_OF_BUDGET`

TRACE or an equivalent observer SHOULD preserve this distinction when attached.

---

## 4. Minimal-Power Challenger

Before adding a permanent agent role, adapter, control-plane, watcher, specialized tool wrapper, or custom service, Raison d'être MUST consider a simpler challenger that tries to satisfy the same responsibility with less scaffolding.

Candidate order:

```text
EXISTING SIMPLE INTERFACE
→ ORDINARY TOOL / SHELL / API
→ COMPOSITION
→ PROMPT / PROCEDURE
→ MANUAL_BOUNDED
→ SMALL GLUE
→ SPECIALIZED SCAFFOLD
```

The simpler candidate does not win automatically.

Complex machinery may survive when it materially improves one or more frozen requirements such as:

- independence;
- safety/authority separation;
- evidence quality;
- reproducibility;
- operator burden;
- reliability;
- recovery;
- whole-life cost.

But convenience alone does not create an automatic right to exist.

`SPECIALIZATION MUST BE EARNED.`

This challenger exists primarily to prevent successful findings from turning Ultimate Loop into an ever-growing SimCity of roles and adapters.

---

## 5. External Nemesis Lane

When a workload depends materially on external/distributed behavior, METEOR or the Reality Gate MAY include a separate fault-injection lane that attacks the world around the implementation.

Candidate faults include only those explicitly authorized by the workload, for example:

- process restart/crash;
- network interruption/partition/latency;
- dependency timeout/unavailability;
- retry/reordering/duplication;
- storage/read/write failure in a test harness;
- clock disturbance where safely simulated;
- provider partial failure or malformed response through a stub/proxy;
- stale cache or delayed propagation;
- resource exhaustion inside a sandbox.

Required separation:

```text
NORMAL WORKLOAD HISTORY
+
NEMESIS / FAULT HISTORY
→ ORDERABLE COMBINED EVIDENCE
→ CHECKER / EXPECTED SAFETY & RECOVERY PROPERTIES
```

Rules:

1. Fault injection requires an explicit test/dogfood/sandbox authority boundary.
2. This extension grants NO implicit authority to attack production, third-party services, shared infrastructure, or systems not owned/authorized for testing.
3. Fault events remain source evidence distinct from later causal interpretation.
4. The implementation may pass normal METEOR and still fail the External Nemesis Lane.
5. Where fault injection is impossible, the untested external failure class remains explicit.

`CONTROLLED CHAOS != UNBOUNDED DAMAGE.`

---

## 6. Formalization Escalation

Formal/model-based verification is an escalation challenger, not a universal requirement.

Consider escalation when one or more of the following survive DA:

- recurring high-severity state-transition bugs;
- concurrency/order/interleaving defects;
- authority transitions that remain difficult to reason about;
- recovery/rollback/idempotency behavior with many reachable states;
- an invariant repeatedly reopens after multiple implementation fixes;
- the disputed property can be represented by a compact useful model.

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

Rules:

- No formal tool is mandatory by name.
- A model may be wrong or incomplete; model assumptions are evidence boundaries.
- Model-check success proves only the checked model/property/configuration scope.
- Counterexample traces are valuable attack/replay inputs.
- Formal verification never substitutes for Git integration evidence, deployment identity, live provider evidence, device evidence, or other real-world gates.

`FORMAL MODEL != WORLD.`

---

## Interaction with TRACE

TRACE remains observer, not governor.

When attached and supported by its current schema/profile, useful material evidence includes:

- generated attack lane start/stop;
- generator/model/config identity;
- case/seed identity;
- operation sequence;
- minimized counterexample linkage;
- replay packet identity;
- replay result;
- destruction-bound configuration and bound exhaustion;
- nemesis/fault events;
- model-check run identity and counterexample trace reference;
- human decision to raise a bound or authorize a new fault class.

If TRACE cannot represent a new event faithfully, that is an observer capability gap. It does not authorize lossy reinterpretation.

`OBSERVER SCHEMA GAP != EVENT DID NOT HAPPEN.`

---

## Interaction with convergence

Generated attacks and nemesis faults can produce large volumes of superficially different failures.

Convergence therefore operates on materially distinct perspectives/root causes, not raw case count.

A practical classification may consider:

```text
NOVELTY × SEVERITY × INDEPENDENCE × ACTIONABILITY
```

but no scoring formula is mandatory.

Required distinctions:

- new case / same root cause;
- new root cause / known perspective;
- genuinely new perspective;
- false positive / invalid oracle;
- untested due to bound exhaustion;
- blocked by external evidence boundary.

The method may stop for convergence only when no materially new perspective survives under the current authorized workload and evidence.

---

## Raison d'être / Counter-DA summary

Rejected alternatives:

- mandatory Schemathesis integration;
- mandatory Hypothesis integration;
- full TigerBeetle-style physical determinism for arbitrary workloads;
- mandatory Jepsen infrastructure;
- mandatory TLA+ for all features;
- replacing DA with fuzzing;
- replacing real-world validation with model checking;
- adding permanent new agent roles solely to host these ideas.

Surviving architecture:

```text
ULTIMATE LOOP CORE
├─ deliberate DA / METEOR
├─ optional Generated Attack Lane
├─ Replay Packet contract
├─ Bounded Destruction contract
├─ Minimal-Power Challenger
├─ optional External Nemesis Lane
└─ conditional Formalization Escalation
```

All concrete tools remain replaceable occupants.

## Acceptance gate

This extension may be promoted only if all are true:

- no named external repository is required for Ultimate Loop operation;
- generated testing cannot masquerade as correctness proof;
- destructive expansion is bounded or explicitly externally stopped;
- budget exhaustion cannot masquerade as convergence;
- exact replay is claimed only inside the captured deterministic envelope;
- minimality cannot delete necessary independence or safety boundaries by default;
- external fault injection is constrained to explicit authorized targets;
- formal models remain distinct from runtime evidence;
- TRACE remains observer, not authority.

If any fails, return this extension to DA rather than weakening the invariant.
