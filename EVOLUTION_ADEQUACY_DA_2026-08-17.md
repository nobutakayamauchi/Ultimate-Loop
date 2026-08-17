# Ultimate Loop Evolution Adequacy DA — 2026-08-17

Status: `FINAL PRE-MERGE DA / COUNTER-DA / ADEQUACY REVIEW`

Subject:

- `EXTERNAL_CHALLENGER_SWEEP_2026-08-17.md`
- `GENERATED_DESTRUCTION_EXTENSION.md`
- `GENERATED_DESTRUCTION_POST_DA.md`

Question:

> After the external-challenger evolution, does Ultimate Loop contain unnecessary machinery, omit necessary machinery, or lack a reliable way to decide which evolved elements are applicable to a frozen workload?

This pass treats evolution itself as suspect. An idea does not survive merely because it came from a strong external repository or because an earlier DA found it useful.

---

## Adequacy criteria

The evolved method is acceptable only if it can distinguish all of the following without hand-waving:

```text
NEEDED
OPTIONAL
NOT_APPLICABLE
BLOCKED / UNEXPLORED
REDUNDANT
WRONG-ORACLE / HARNESS FAILURE
REAL SYSTEM FAILURE
BOUND EXHAUSTION
GENUINE CONVERGENCE
```

And it must do so without:

- creating a fourth core loop;
- requiring any named external repository;
- duplicating an existing Ultimate Loop responsibility under a new name;
- making generated testing or formal methods into correctness authority;
- granting implicit destructive authority;
- making TRACE into a governor;
- turning auditability into raw-world/secret hoarding.

---

# DA — excess / unnecessary elements

## E1 — `Minimal-Power Challenger` duplicates existing Raison d'être structure

Existing canonical Raison d'être already requires:

```text
DROP
→ EXTERNALIZE
→ COMPOSE
→ MANUAL_BOUNDED
→ GLUE
→ IRREDUCIBLE_BUILD
```

and explicitly says reuse-first and `NO SURVIVAL, NO BUILD`.

The mini-SWE-agent challenger exposed a valuable failure mode — confusing scaffold with capability — but adding a new permanent lane or pseudo-loop for it would duplicate an existing responsibility.

### Decision

`REMOVE AS STANDALONE COMPONENT / FOLD INTO RAISON D'ÊTRE`

Retain only the normative reinforcement:

```text
MORE SCAFFOLD != MORE CAPABILITY
SPECIALIZATION MUST BE EARNED AGAINST THE SAME FROZEN REQUIREMENTS
```

The simpler candidate is considered inside Raison d'être; it is not a new loop, gate, agent, or mandatory waterfall.

---

## E2 — external repositories must not become permanent method dependencies

Schemathesis, TigerBeetle, mini-SWE-agent, Jepsen, Hypothesis, and TLA+ are useful lineage/challenger sources.

The method must remain functional if every one of them disappears.

### Decision

`KEEP LINEAGE / REJECT CORE DEPENDENCY`

No tool-specific adapter is canonical merely because the source idea survived.

---

## E3 — full physical determinism is unnecessary for arbitrary Ultimate Loop workloads

Physical determinism is powerful in controlled systems but unrealistic across SaaS, humans, devices, networks, clocks, and nondeterministic models.

### Decision

`REJECT UNIVERSAL DETERMINISM`

Keep deterministic replay only inside the controllable envelope and preserve the nondeterministic remainder explicitly.

---

## E4 — universal formalization is unnecessary

Formal methods are expensive and can create their own state-space/model-drift failure modes.

### Decision

`KEEP AS ESCALATION ONLY`

Do not add a universal TLA+/model-check gate.

---

## E5 — separate mutation/differential/metamorphic lanes are not justified yet

These are useful generated-testing/oracle techniques, but promoting each technique to a permanent named lane would recreate the SimCity problem.

### Decision

`DO NOT ADD NEW CORE LANES`

They may be replaceable techniques inside Generated Attack or Oracle/Checker challenge when appropriate.

---

# DA — missing / insufficient elements

## M1 — no common Applicability & Completeness Gate

The extension says several mechanisms are optional or conditional, but does not provide one common way to distinguish:

- should run;
- may run;
- does not apply;
- cannot currently run;
- was simply skipped.

Without this, optionality can become invisible under-testing, while a cautious implementation can also run every expensive lane on every workload and overbuild the method.

### Required addition

Before promotion, every evolved mechanism relevant to the workload receives an explicit status:

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

- `NOT_APPLICABLE` requires a reason tied to the frozen workload.
- `BLOCKED != PASS`.
- `NOT_RUN != NOT_APPLICABLE`.
- a REQUIRED lane that is blocked, unexplored, unknown, failed, or budget-exhausted cannot silently become promotion evidence.
- applicability decisions are themselves DA-challengeable.
- a lane is not REQUIRED merely because a tool exists or a machine-readable schema happens to exist.

Decision: `MUST ADD`.

---

## M2 — generated attacks lack an explicit oracle/checker integrity boundary

Generated input is only useful if the property deciding success/failure is trustworthy.

A generator can produce thousands of cases and still generate false findings if:

- the schema is stale;
- the expected property is wrong;
- the checker encodes the same bug as the implementation;
- the harness fails instead of the target;
- the generated sequence violates a precondition the workload never promised.

### Required addition

Every material generated finding must classify the evidence source as one of:

```text
SYSTEM_FAILURE
ORACLE_FAILURE
HARNESS_FAILURE
UNKNOWN
```

The checker/property must bind to an independently grounded contract, invariant, reference behavior, or explicit frozen expectation where practical.

`GENERATOR OUTPUT != ORACLE AUTHORITY`

If generator and checker share the same implementation assumption, Counter-DA must challenge that shared assumption before promotion-critical conclusions are drawn.

Decision: `MUST ADD`.

---

## M3 — stateful generated attacks need destructive target / reset boundaries

The External Nemesis lane has explicit fault authority, but Generated Attack can also be destructive: create/delete/update operations, entitlement mutations, payment-like fixtures, storage writes, account state, or irreversible workflow transitions.

A schema-driven tool aimed at the wrong endpoint can damage real state without ever invoking the Nemesis lane.

### Required addition

Before a generated attack capable of material side effects:

```text
TARGET IDENTITY
+ AUTHORIZED TEST / DOGFOOD BOUNDARY
+ SIDE-EFFECT POLICY
+ DATA CLASSIFICATION
+ RESET / RECOVERY PATH
+ BLAST-RADIUS BOUND
→ GENERATED DESTRUCTION AUTHORIZED
```

Ambiguous, production, shared, or third-party targets fail closed unless separately and explicitly authorized.

Decision: `MUST ADD`.

---

## M4 — normative guardrails are split between candidate and post-DA files

The current extension says one thing, while `GENERATED_DESTRUCTION_POST_DA.md` later narrows several meanings (secret-safe replay, seed insufficiency, wrong-target faulting, state-space exhaustion, model drift, repeated bound raising).

A canonical rule should not require the operator to discover a later document to learn its safe meaning.

### Required addition

Fold the surviving post-DA guardrails into the canonical extension itself.

The post-DA file remains lineage/evidence of why the rules exist, not a hidden second source of truth.

Decision: `MUST ADD`.

---

## M5 — canonical METHOD does not currently point to the evolved extension

A PR that adds an extension without linking it from `METHOD.md` creates an orphaned doctrine: merged code exists, but the canonical method does not establish when it is part of Ultimate Loop.

This violates the same class of distinction Ultimate Loop already enforces elsewhere:

```text
FILE EXISTS != CANONICAL METHOD INTEGRATED
```

### Required addition

Add a compact section to `METHOD.md` defining:

- Generated Attack as conditional METEOR support;
- Replay Packet and Bounded Destruction as cross-cutting contracts;
- anti-scaffold minimality as a Raison d'être reinforcement, not a new lane;
- External Nemesis as conditional hostile-world testing;
- Formalization as escalation only;
- the Applicability & Completeness Gate;
- a pointer to the detailed extension.

Decision: `MUST ADD`.

---

# Counter-DA — are the missing elements themselves overengineering?

## C1 — does Applicability Gate become another control plane?

No, if represented as a small classification attached to the frozen workload rather than a service/agent/workflow engine.

It exists to prevent both over-testing and silent under-testing.

`CLASSIFICATION != NEW ORCHESTRATOR`

## C2 — does Oracle Integrity require a second checker for every checker?

No.

It requires explicit grounding and classification of checker/harness failure where material. Independent reference/differential checking is used only where the frozen risk justifies it.

`CHALLENGE THE ORACLE != INFINITE ORACLE RECURSION`

## C3 — does generated-target authorization duplicate External Nemesis?

It shares the same safety principle but closes a different entry point. Stateful/schema-generated operations can mutate state without any injected external fault.

The rule should reuse the same authorization vocabulary, not create a separate authority subsystem.

## C4 — should Replay Packet be removed because Post-deploy Reality Gate already replays failed probes?

No.

Existing Reality Gate replay is runtime/post-change specific. Replay Packet generalizes material failures discovered before deployment, in generated tests, model counterexamples, and fault-injection histories.

Decision: `KEEP`.

## C5 — should Bounded Destruction be removed because convergence already stops when no new perspective survives?

No.

Convergence and exhaustion are different stop causes. A loop can still be producing new perspectives when time/token/cost bounds are hit.

Decision: `KEEP`.

## C6 — should Formalization Escalation be removed because DA/METEOR already tests invariants?

No, but keep it conditional.

It covers reachable-state/order spaces that prose and example tests can repeatedly fail to reason about. It never replaces real-world evidence.

Decision: `KEEP CONDITIONAL`.

---

# Final normalized architecture

After adequacy review, the evolved architecture is not "six new permanent challengers".

It is:

```text
ULTIMATE LOOP CORE
├─ existing Raison d'être
│  └─ strengthened anti-scaffold rule: specialization must be earned
├─ existing deliberate DA / METEOR
│  └─ conditional Generated Attack Lane
├─ cross-cutting Replay Packet contract
├─ cross-cutting Bounded Destruction contract
├─ conditional External Nemesis Lane
├─ conditional Formalization Escalation
└─ small Applicability & Completeness classification
```

Cross-cutting evidence rule:

```text
GENERATED / FAULT / MODEL FINDING
→ ORACLE / HARNESS / TARGET AUTHORITY CHECK
→ CLASSIFY
→ REPLAY / FIX / REGRESSION AS APPLICABLE
```

No new permanent agent role is required.

---

# Final adequacy verdict

Before corrections: `NOT MERGE READY FOR ADEQUACY`.

Required corrections:

1. fold Minimal-Power into Raison d'être rather than treating it as a standalone component;
2. add Applicability & Completeness Gate;
3. add Oracle/Checker Integrity;
4. add generated-destructive target/reset authority;
5. fold post-DA normative guardrails into the canonical extension;
6. integrate the extension into `METHOD.md`.

If those corrections are present and the PR remains tool-neutral, bounded, observer-separated, and mergeable:

`PASS / ADEQUATE / MERGE AUTHORIZED BY USER`.

No additional permanent core lane is justified by this review.
