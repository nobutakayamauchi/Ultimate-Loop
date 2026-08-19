# Development Sequence Loop — Ultimate Loop

Status: `PROVISIONAL_OPERATIONAL / CANONICAL / ACTIVE / SELF_EVOLVING`

Formal name: **Development Sequence Loop**  
Common name: **Ultimate Loop**  
Current release: **v0.1**

Ultimate Loop is a development method for deciding what responsibility deserves to exist, which implementation deserves to occupy it, when that occupant should be replaced, and how the human-important outcome remains reconstructable when implementations, providers, tools, or the original creator disappear.

It is not one framework, runtime, product, provider, or model.

`PROVISIONAL_OPERATIONAL` means the sequence is complete enough to run end-to-end under current evidence. It does not mean the method is permanently finished.

## Canonical motto

> **百万回死んでも残るものだけ、作るべきである。**

Operational form:

> **百万回殺せ。なお立つものだけ作れ。**

This language applies to ideas, requirements, architectures, implementations, dependencies, and promoted software occupants — not to people.

---

## Canonical development flow

```text
WISH / PROBLEM / EVENT / EXTERNAL CAPABILITY SIGNAL
→ FROZEN SUBJECT + WORKLOAD
→ CURRENT DISCOVERY SWEEP
→ LOOP 1: RAISON D'ÊTRE DESTROY
→ KEEP EXISTING / EXTRACT / COMPOSE / MANUAL_BOUNDED
→ IRREDUCIBLE GAP OR MATERIAL ARCHITECTURE DEFICIT
→ BOUNDED PROTOTYPE / REALITY CANDIDATES
→ LOOP 2: METEOR CRUCIBLE
→ PROMOTED SURVIVOR
→ DEPLOY / PUBLISH WHEN APPLICABLE
→ DEPLOYMENT IDENTITY
→ POST-DEPLOY DEBUG / REALITY GATE
→ DEPLOYMENT_VALIDATED / FIX_VALIDATED
→ STABLE CORE / MOVABLE FRAME
→ WATCH + EXTERNAL CAPABILITY FEED
→ PERIODIC CHALLENGER SWEEP + EVENT TRIGGERS
→ MATERIAL FAILURE / BETTER CHALLENGER / ERA CHANGE
→ LOOP 3: DARWIN ARENA / KNOCKOUT MATCH
→ SURVIVE / RECOMPOSE / PARTIAL REPLACE / FULL REPLACE / DIE
→ PHOENIX LINEAGE PRESERVES MEMORY + REGENERATION CAPABILITY
→ repeat
```

Offline/library artifacts may have no live deployment surface. Their workload must explicitly declare an equivalent verification boundary instead of fabricating runtime evidence.

---

## TRACE observation layer

Ultimate Loop may attach a passive observer to preserve material transitions, source evidence, human decisions, UNKNOWN/CONFLICT states, findings, corrections, test outcomes, deployment identity, and external-evidence boundaries.

The current observer profile is TRACE.

```text
ULTIMATE LOOP DECIDES / ACTS
TRACE OBSERVES / PRESERVES
```

TRACE is cross-cutting and does not become a fourth loop.

Hard boundaries:

- `TRACE OBSERVER != GOVERNOR`;
- observation does not create promotion authority;
- a Git commit or PR is evidence of a repository transition, not automatic proof of semantic promotion or runtime correctness;
- source evidence remains distinct from derived claims and metrics;
- retrospective reconstruction must never masquerade as live observation;
- hidden model chain-of-thought is outside the evidence contract;
- observer loss cannot silently become a claim of complete reconstructability.

Ultimate Loop remains operable without TRACE unless the frozen workload explicitly makes auditability mandatory. When TRACE evidence is missing, the correct result is degraded reconstructability / UNKNOWN, not invented success.

The detailed observer contract is defined in [TRACE_OBSERVATION_LAYER.md](TRACE_OBSERVATION_LAYER.md). TRACE itself remains replaceable and is subject to Raison d'être, METEOR, and DARWIN like any other occupant.

---

## Gate 0 — Current landscape discovery

Before a new program or challenger may claim superiority, refresh the surrounding implementation landscape.

`NO CURRENT LANDSCAPE SWEEP → NO SUPERIORITY CLAIM`

Discovery may use replaceable external search engines, feeds, APIs, GitHub/package registries, official documentation, human research, or AI-assisted research.

Ultimate Loop does not require an owned crawler.

`SEARCH_SATURATED_UNDER_CURRENT_EVIDENCE != COMPLETE_WEB_KNOWLEDGE`

`DISCOVERY != METEOR WIN != PROMOTION AUTHORITY`

A materially new candidate, architecture term, dependency, provider capability, or failure mode reopens the frontier.

---

## External Capability Feed — challenger supply, not a fourth loop

Ultimate Loop may maintain or consume a replaceable **External Capability Feed** that supplies current external capability changes into Gate 0, WATCH, and DARWIN.

It may observe material changes in models, agents, APIs, SDKs, MCP/tool integrations, OSS/packages, hosted services, partnerships/integrations, pricing, availability, limits, deprecations, security, infrastructure, workflow tools, and development protocols.

The feed owns no decision authority.

```text
EXTERNAL SIGNAL
!= VERIFIED CAPABILITY
!= METEOR WIN
!= DARWIN WIN
!= PROMOTION AUTHORITY
```

A signal should be triaged only when it plausibly maps to a frozen responsibility/current occupant and could materially change necessity, architecture, whole-life fitness, operator burden, reliability, security/privacy, cost, recoverability, provider risk, or evidence maturity.

`NEW != BETTER`

`NO FEED HIT != NO EXTERNAL CHANGE`

`STALE FEED != CURRENT LANDSCAPE`

Repeated coverage of the same capability does not reopen work without materially new evidence.

Ultimate Loop owns the responsibility to refresh current reality, not a particular crawler, scheduler, model, provider, database, or monitoring stack. The feed may be manual, scheduled, event-driven, AI-assisted, provider-native, registry-backed, or composed from replaceable external services.

The feed remains bounded by workload-scoped source, cadence, cost/token/API, retention, privacy, and escalation limits. It must not export private frozen workloads or secrets without explicit authority.

Before a material superiority or replacement claim, Gate 0's targeted current sweep remains required even when a standing feed exists.

Ultimate Loop remains operable without a live feed. If a claim depends on current external superiority and current evidence is unavailable, the correct result is an explicit stale/UNKNOWN boundary rather than invented absence of challengers.

Detailed contract: [EXTERNAL_CAPABILITY_FEED.md](EXTERNAL_CAPABILITY_FEED.md).  
DA / Counter-DA: [EXTERNAL_CAPABILITY_FEED_DA_2026-08-19.md](EXTERNAL_CAPABILITY_FEED_DA_2026-08-19.md).

---

## Loop 1 — Raison d’être Destroy

**Question:** Should this responsibility exist at all?

```text
DROP
→ EXTERNALIZE
→ COMPOSE
→ MANUAL_BOUNDED
→ GLUE
→ IRREDUCIBLE_BUILD
```

Core rule:

`NO SURVIVAL, NO BUILD.`

Reuse-first remains the default, but reuse is not a permanent veto on new construction.

A bounded new-build candidate is permitted when either:

1. the surviving responsibility is irreducible; or
2. existing holders have a material architecture deficit for the frozen workload and a new design can plausibly achieve materially better whole-life fitness.

> **Reuse first, but do not preserve an inferior architecture merely because it already exists.**

`PROTOTYPE AUTHORIZED != PROMOTION AUTHORIZED`

Raison d'être also carries an explicit anti-scaffold rule:

`MORE SCAFFOLD != MORE CAPABILITY`

Before adding a permanent agent role, adapter, watcher, control-plane, specialized wrapper, or custom service, consider whether an existing simpler holder, composition, ordinary tool/API/shell path, bounded manual step, procedure, or small glue can satisfy the **same frozen requirements**. Simpler does not win by deleting necessary independence, authority separation, evidence, safety, reproducibility, reliability, or recovery. Specialization must earn its whole-life cost.

This is a reinforcement of Raison d'être, not a new loop or mandatory candidate waterfall.

---

## Loop 2 — METEOR Crucible

**Question:** Which concrete implementation can actually survive reality best?

Materialize the strongest existing/external composition and the smallest justified custom challenger. Attack them with the same frozen workload, evidence requirements, authority boundaries, destructive cases, recovery obligations, and whole-life criteria.

Comparison may include:

- quality and capability;
- performance and efficiency;
- reliability;
- operator burden;
- security and privacy;
- maintainability;
- cost;
- migration and rollback;
- dependency/provider risk;
- recoverability;
- evidence maturity;
- PHOENIX implications.

A benchmark win alone is not enough. A challenger cannot win by deleting inherited safety, durability, evidence, authority, or recovery requirements.

Possible outcomes include:

`KEEP / PARTIAL_REPLACE / FULL_REPLACE / STANDBY / REJECT`

---

## Generated destruction / replay extension

METEOR and the Reality Gate may use additional destructive/evidence modes when the frozen workload justifies them. These modes do not create a fourth loop and do not require any named external tool.

Before promotion, applicable modes are classified explicitly:

```text
REQUIRED / OPTIONAL / NOT_APPLICABLE / BLOCKED
```

Their execution/result state is separate:

```text
PASS / FAIL / BOUND_EXHAUSTED / UNEXPLORED / UNKNOWN
```

`NOT_RUN != NOT_APPLICABLE` and `BOUND_EXHAUSTED != CONVERGENCE`.

The extension provides:

- **Generated Attack Lane** — conditional schema/grammar/property/state-model driven values and operation sequences, with oracle/harness/system-failure separation and explicit authority before destructive side effects;
- **Replay Packet** — a cross-cutting, secret-safe compact manifest for replaying material failures inside the captured deterministic envelope;
- **Bounded Destruction** — explicit limits for self-expanding loops/generators/retries/queues/parallelism/time/tokens/tool calls/cost/storage, with exhaustion preserved as an open frontier rather than false convergence;
- **External Nemesis Lane** — conditional controlled fault injection against the world around the implementation, only inside explicit target/authorization/blast-radius/recovery boundaries;
- **Formalization Escalation** — conditional state/model checking for recurring high-severity order/concurrency/authority/recovery problems, never a substitute for implementation or runtime evidence.

Core distinctions include:

```text
GENERATOR OUTPUT != ORACLE AUTHORITY
SEED != COMPLETE REPLAY PACKET
AFTER FAULT != BECAUSE OF FAULT
MODEL CHECK PASS != RUNTIME EVIDENCE
CONVERGED_UNDER_CURRENT_SCOPE != PROMOTION_READY
```

The detailed canonical contract is [GENERATED_DESTRUCTION_EXTENSION.md](GENERATED_DESTRUCTION_EXTENSION.md). Its external-source lineage and DA history remain evidence for why these rules exist; the named source projects are not permanent method dependencies.

---

## Post-deploy Debug / Reality Gate

Build success or deployment completion does not prove runtime correctness.

`DEPLOYED != OBSERVED_CORRECT`

Where a runtime surface exists:

```text
DEPLOY / PUBLISH
→ DEPLOYMENT IDENTITY
→ REQUIRED PROBES
→ EXPECTED vs OBSERVED
→ EVIDENCE BINDING
→ FAILURE ANALYSIS
→ AUTHORIZED PATCH / CHANGE
→ DEPLOYMENT RE-IDENTITY
→ EXACT FAILED-PROBE REPLAY
→ REGRESSION
→ FIX_VALIDATED / RETURN TO ANALYSIS
```

Hard invariants:

- `SELF_DECLARED_IDENTITY != DEPLOYMENT_IDENTITY`;
- `CODE EXISTENCE != RUNTIME EVIDENCE`;
- `RUNTIME-TO-CODE MAPPING != ROOT CAUSE`;
- runtime, replay, and regression evidence must bind to verified deployment identity;
- post-change deployment identity must be genuinely new;
- temporal order must be proven: `INITIAL_OBSERVATION < CHANGE_APPLIED < POST_CHANGE_OBSERVATION`;
- `PATCH APPLIED != FIX VALIDATED`;
- blocked or missing required evidence fails closed.

A clean deployment satisfying all required probes may become `DEPLOYMENT_VALIDATED`. A repaired deployment becomes `FIX_VALIDATED` only after verifier-controlled re-identity, exact failed-probe replay, and regression evidence.

---

## Loop 3 — DARWIN Arena / Knockout Match

**Question:** Does the current promoted occupant still deserve its slot now?

Every promoted implementation lives in a **Movable Frame**.

A credible challenger may be triggered by:

- model capability;
- OS/platform change;
- API/OSS/SaaS change;
- new integration/partnership that creates a materially reachable capability;
- price;
- provider behavior;
- security;
- user burden;
- law/procedure;
- runtime evidence;
- a new failure class.

Possible results:

- incumbent survives;
- challenger replaces incumbent;
- hybrid recomposition survives;
- partial replacement;
- both die and necessity is reopened.

No implementation gains a permanent right to exist.

---

## WATCH and self-evolution

STABLE means stable-by-default, not ignored forever.

WATCH observes material changes in models, libraries, APIs, algorithms, OSS, competitors, infrastructure, pricing, degradation/deprecation, vulnerabilities, shutdowns, and real-world evidence.

The External Capability Feed is a replaceable supply path into WATCH. It may reduce discovery latency, but it does not replace periodic targeted challenger sweeps or create automatic replacement authority.

A discovery is a candidate trigger, not automatic replacement authority.

Doing nothing may be the correct result.

Ultimate Loop itself is subject to Ultimate Loop.

A periodic challenger sweep may refresh the landscape around the method and its material occupants. A knockout match occurs only when a material challenger, materially superior architecture, new failure class, or other credible challenge exists.

`ULTIMATE LOOP = NEVER PERMANENTLY IMMUNE FROM CHALLENGE`

---

## Emergency / recovery rule

Outage, shutdown, compromise, account loss, network loss, corruption, storage loss, provider disappearance, or material instability may enter a bounded Emergency Recovery / Failover Gate.

The objective is minimum viable restoration, not improvement.

Emergency restoration may temporarily proceed without a full discovery sweep when delay would materially worsen recovery. The missing sweep becomes explicit recovery debt.

`EMERGENCY_USE != PROMOTION`

---

## Creator-independent continuity

Ultimate Loop is bounded by **PHOENIX LINEAGE**.

The protected subject is not code, a provider, or the creator. It is the human-important outcome and enough material evidence, state, meaning, decisions, failure history, authority boundaries, and recovery path to reconstruct that outcome using the best currently available means.

`IMPLEMENTATION MAY DIE`

`RESPONSIBILITY MAY MOVE`

`PROVIDER MAY DISAPPEAR`

`CREATOR MAY BE ABSENT`

but the lineage needed to determine what mattered, what failed, what must be preserved, and how to rebuild must survive.

---

## Memory rule

Every survivor inherits useful memory of the dead:

- frozen workloads;
- failure/autopsy records;
- rejected and near-winning alternatives;
- unresolved UNKNOWNs;
- authority boundaries;
- evidence/recovery requirements;
- migration assumptions;
- predecessor lineage.

`NEW OCCUPANT != NEW MEMORY.`

---

## Method invariant

**Search current reality before claiming superiority. Keep a bounded, replaceable path for material external capability changes to reach discovery and challenger selection without granting that feed authority. Kill the need. Kill the implementation. Keep challenging the incumbent when reality changes. Verify deployed reality before calling it stable. Preserve recovery capability. Preserve the human-important outcome and the memory required to regenerate it. Observe material history when reconstructability matters, without allowing the observer to become unearned authority. Generate and replay destructive evidence when justified, bound destructive expansion, distinguish untested/blocked scope from convergence, and never let a generator, fault injector, model checker, observer, or external capability feed silently become promotion authority.**

Historical canonical source: [RTS / thin-rts / ULTIMATE_LOOP_METHOD.md](https://github.com/nobutakayamauchi/RTS/blob/main/thin-rts/ULTIMATE_LOOP_METHOD.md)
