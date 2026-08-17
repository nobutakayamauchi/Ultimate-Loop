# External Challenger Sweep — 2026-08-17

Status: `DA / COUNTER-DA COMPLETE / ADOPTION CANDIDATES FROZEN`

## /goal

Challenge Ultimate Loop itself with external repositories that embody materially different testing, failure, simplicity, replay, and formal-verification ideas.

The objective is not to import these projects wholesale. The objective is to identify which ideas survive Raison d'être, DA, Counter-DA, and tool-independence requirements strongly enough to become part of the method.

Frozen sequence:

1. `schemathesis/schemathesis`
2. `tigerbeetle/tigerbeetle`
3. `SWE-agent/mini-swe-agent`
4. `jepsen-io/jepsen`
5. `tlaplus/tlaplus`

## Global acceptance rules

An external idea survives only if:

- it closes a real Ultimate Loop blind spot;
- it remains useful when the source repository/tool is replaced;
- it does not silently enlarge the method into a mandatory control-plane;
- it can preserve UNKNOWN instead of inventing assurance;
- it has a bounded cost / scope / authority surface;
- it produces evidence that TRACE or an equivalent observer can preserve;
- it does not convert a testing aid into promotion authority.

`EXTERNAL INSPIRATION != CORE DEPENDENCY`

`TEST GENERATOR != PROOF OF ABSENCE`

`MODEL CHECK PASS != DEPLOYMENT EVIDENCE`

---

## 1 — Schemathesis

Source: `https://github.com/schemathesis/schemathesis`

Observed challenger properties:

- derives test inputs from OpenAPI / GraphQL schemas;
- adapts testing to server responses;
- can chain operations into stateful workflows;
- is built on Hypothesis / property-based generation;
- exposes reproducible failure-oriented reporting.

### DA

Ultimate Loop METEOR can become too dependent on attacks that a human or model explicitly thinks of. A strong DA may still fail to sample combinations that only emerge from generated values or operation sequences.

Blind spot:

`IMAGINED ATTACK SET != REACHABLE FAILURE SPACE`

### Counter-DA

Making Schemathesis mandatory would overfit the method to HTTP APIs and OpenAPI/GraphQL. Many Ultimate Loop workloads have no machine-readable API schema.

### Survivor

Adopt a tool-neutral **Generated Attack Lane**:

- when a useful schema, grammar, property set, or state model exists, generate destructive inputs and sequences in addition to deliberate DA/METEOR attacks;
- generated failures must bind to their generator/model/configuration identity;
- a failure should be reduced to a small replayable counterexample where practical;
- no generator may claim absence of bugs merely because it found none.

Decision: `PARTIAL_ADOPT / TOOL_REPLACEABLE`

---

## 2 — TigerBeetle

Source: `https://github.com/tigerbeetle/tigerbeetle`

Observed challenger properties:

- determinism is treated as a meta-principle;
- simulation/fuzzing is paired with explicit assertions and a precise mental model;
- positive and negative space are both asserted;
- loops, queues, memory and other resources are explicitly bounded;
- replay and deterministic state transitions make failures materially easier to reproduce and investigate.

### DA

A destructive run that discovers a failure but cannot reconstruct the failure world is weaker evidence than it appears. Ultimate Loop can currently learn from findings while still losing enough environment/order/randomness data to make exact replay difficult.

Blind spot:

`FAILURE OBSERVED != FAILURE REPRODUCIBLE`

A second blind spot is destructive self-expansion: a loop that keeps discovering new perspectives can burn unbounded time, tokens, compute, tool calls, or generated cases unless the workload defines explicit limits.

### Counter-DA

Requiring full physical determinism is unrealistic across arbitrary web services, humans, SaaS providers, clocks, distributed networks, and nondeterministic models.

### Survivor

Adopt **Replay Packets** and **Bounded Destruction**:

- deterministic replay is preferred where controllable;
- otherwise capture enough state, seed/configuration, event ordering, deployment identity, and external evidence to make the unreproducible remainder explicit;
- loops/generators/retries/queues/time/token/cost budgets must have declared bounds when they can materially expand;
- exhaustion of a bound is a recorded stop reason, not silent convergence.

Decision: `PARTIAL_ADOPT / DETERMINISM-WHERE-CONTROLLABLE`

---

## 3 — mini-SWE-agent

Source: `https://github.com/SWE-agent/mini-swe-agent`

Observed challenger properties:

- deliberately tiny agent scaffold;
- bash-only tool surface in the minimal agent;
- linear history;
- independent action execution;
- explicit challenge to the assumption that more agent tooling means better capability.

### DA

Ultimate Loop is good at discovering missing responsibilities and adding defenses. That creates a structural risk: every successful finding can justify another role, adapter, watcher, gate, special tool, or control-plane.

Blind spot:

`MORE SCAFFOLD != MORE CAPABILITY`

### Counter-DA

Minimality is not automatically virtue. Dedicated tools, validators, authority separation, observers, and deployment gates may be justified when they close evidence or safety gaps that a generic shell/model cannot close reliably.

### Survivor

Adopt a **Minimal-Power Challenger** before adding permanent machinery:

- test whether the responsibility can be satisfied by an existing simple interface, ordinary tool, composition, prompt/procedure, or bounded manual step;
- new scaffolding must beat that simpler challenger on the frozen workload;
- complexity retained only for convenience does not automatically survive Raison d'être.

Decision: `ADOPT AS ANTI-SIMCITY CHALLENGER`

---

## 4 — Jepsen

Source: `https://github.com/jepsen-io/jepsen`

Observed challenger properties:

- operations are generated and their starts/ends preserved in a history;
- a separate nemesis injects faults while normal operations execute;
- a checker evaluates the resulting history for correctness;
- performance/availability under faults can be characterized;
- test artifacts survive for later investigation.

### DA

Internal adversarial testing can leave the surrounding world too healthy. Real failures often arise from interruption, partial availability, retry, restart, network, clock, disk, dependency, or provider behavior rather than a direct code-path bug.

Blind spot:

`INTERNAL METEOR PASS != HOSTILE WORLD PASS`

### Counter-DA

Fault injection against production can be destructive and irresponsible. Not every workload is distributed. Jepsen itself is not a universal test adapter.

### Survivor

Adopt an **External Nemesis Lane** when the frozen workload depends on external or distributed state:

- inject controlled failures only inside an explicitly authorized test/dogfood boundary;
- preserve normal operation history and nemesis/fault history separately but orderably;
- check the combined history against expected safety/recovery properties;
- production fault injection requires separate explicit authority and is never implied by the method.

Decision: `PARTIAL_ADOPT / SAFE-BOUNDARY REQUIRED`

---

## 5 — TLA+

Source: `https://github.com/tlaplus/tlaplus`

Observed challenger properties:

- TLC provides model checking for TLA+ specifications;
- state spaces can be dumped;
- error traces can be exported/imported, including JSON paths useful for model-based testing and trace validation.

### DA

Ultimate Loop can accumulate strong prose invariants through repeated failures, yet prose can remain internally inconsistent or incomplete when concurrency, authority, ordering, retry, lifecycle, or distributed state grows complex.

Blind spot:

`PROSE INVARIANT != STATE-SPACE VALIDATED INVARIANT`

### Counter-DA

Formal specification of every feature would dramatically increase cost and become another SimCity. A model is still a model: a model-check pass cannot establish deployment identity, integration state, real provider behavior, or user-device correctness.

### Survivor

Adopt **Formalization Escalation**, not universal formal methods:

Escalate to a state-machine/model-checking challenger when one or more are true:

- high-severity state/order/concurrency bugs recur;
- authority transitions are difficult to reason about informally;
- the same invariant repeatedly reopens after implementation fixes;
- recovery/rollback/idempotency behavior spans many reachable states;
- a compact model can materially test the disputed property.

Model traces become challenger evidence and replay inputs, never runtime proof.

Decision: `CONDITIONAL_ADOPT / ESCALATION ONLY`

---

## Cross-challenger DA

### Finding A — Generated attacks can produce noise faster than knowledge

Resolution: generated cases must collapse into distinct root-cause/failure classes where practical. Repeated equivalent failures do not count as new perspective.

### Finding B — Replay can become fake determinism

Resolution: record the controllable deterministic envelope and preserve external nondeterminism as UNKNOWN. Never claim exact replay when external state was not captured or controlled.

### Finding C — Fault injection can confuse cause and effect

Resolution: fault/nemesis events require ordered timestamps or logical ordering and must remain distinguishable from workload operations and later derived causal claims.

### Finding D — Minimality can delete necessary independent validation

Resolution: the Minimal-Power Challenger competes with added machinery; it does not automatically win. Independent validators/observers survive when independence itself is part of the requirement.

### Finding E — Formal methods can become a prestige tax

Resolution: formalization is severity/complexity-triggered. No formal tool is mandatory by name.

### Finding F — External repositories can accidentally become canonical authorities

Resolution: the adopted rules are tool-neutral. All five repositories remain replaceable challengers and lineage sources, not permanent dependencies.

---

## Frozen adopted set

The following six concepts survive:

1. **GENERATED ATTACK LANE** — generate destructive values/sequences when a usable model exists.
2. **REPLAY PACKET** — preserve enough state/seed/config/order/evidence to replay a finding or explicitly classify the unreproducible remainder.
3. **BOUNDED DESTRUCTION** — bound expanding loops, generators, retries, queues, time, tokens, compute, and cost where material.
4. **MINIMAL-POWER CHALLENGER** — force complex new machinery to beat a simpler way of satisfying the same responsibility.
5. **EXTERNAL NEMESIS LANE** — inject controlled world-level failures inside an authorized test boundary.
6. **FORMALIZATION ESCALATION** — escalate recurring high-severity state/authority/concurrency problems to a model-checking challenger when justified.

These are specified canonically in `GENERATED_DESTRUCTION_EXTENSION.md`.

## Merge gate

`ADOPTION CANDIDATES SURVIVE DA / COUNTER-DA`

Before merge, verify that the extension:

- does not require any named external repository;
- does not claim that generated testing proves correctness;
- does not permit unbounded destructive work;
- does not authorize production fault injection;
- preserves observer/governor separation;
- keeps formal models distinct from runtime evidence;
- keeps minimality as a challenger rather than an automatic veto.
