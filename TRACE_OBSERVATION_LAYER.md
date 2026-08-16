# TRACE Observation Layer — Ultimate Loop

Status: `PROVISIONAL / CROSS-CUTTING / NON-AUTHORITATIVE`
Version: `v0`

## Purpose

Ultimate Loop can move faster than a human can reconstruct from Git history alone. TRACE is attached as a passive evidence observer so the development sequence remains reconstructable without turning observation into governance.

Core boundary:

```text
ULTIMATE LOOP DECIDES / ACTS
TRACE OBSERVES / PRESERVES
```

TRACE MUST NOT become promotion authority, veto authority, governor, orchestration kernel, or hidden-rationale recorder.

## Why this exists

A fast Ultimate Loop run may compress the following into minutes:

```text
GOAL
→ discovery
→ Raison d'être
→ candidate
→ DA finding
→ Counter-DA
→ patch
→ test
→ promotion
→ next material finding
```

Git commits preserve important implementation facts, but do not necessarily preserve the complete sequence of human decisions, rejected findings, evidence boundaries, UNKNOWNs, external-evidence handoffs, or why a gate reopened.

TRACE exists to preserve those transitions as evidence.

## Integration shape

```text
                 Ultimate Loop
                      │
        ┌─────────────┼─────────────┐
        │             │             │
   Raison d'être    METEOR        DARWIN
        │             │             │
        └──── material transitions ─┘
                      │
                      ▼
                    TRACE
                passive observer
                      │
          raw evidence + derived records
```

Observation is cross-cutting. It does not add a fourth destruction loop.

## Minimum event contract

A conforming integration SHOULD emit a record when a material transition occurs.

Minimum event families:

- `RUN_STARTED`
- `GOAL_FROZEN`
- `DISCOVERY_FOUND`
- `GATE_ENTERED`
- `GATE_PASSED`
- `GATE_FAILED`
- `FINDING_OPENED`
- `FINDING_REJECTED`
- `FINDING_RESOLVED`
- `COUNTER_DA_RESULT`
- `INVARIANT_ADDED`
- `TEST_ADDED`
- `TEST_RESULT`
- `CHANGE_APPLIED`
- `COMMIT_CREATED`
- `PR_CREATED`
- `PR_MERGED`
- `DEPLOYMENT_IDENTITY`
- `HUMAN_DECISION`
- `HUMAN_OVERRIDE`
- `UNKNOWN_PRESERVED`
- `CONFLICT_PRESERVED`
- `EXTERNAL_EVIDENCE_REQUIRED`
- `RUN_STOPPED`

An implementation MAY use additional event types. New event names do not gain authority merely by existing.

## Evidence requirements

Each record SHOULD preserve, when available:

- stable record ID;
- source type;
- actor;
- source order;
- source timestamp;
- capture timestamp;
- payload;
- payload hash;
- previous record hash / chain position;
- provenance;
- uncertainty classification;
- source evidence references.

Missing evidence remains `UNKNOWN`. Conflicting evidence remains `CONFLICT`.

## Source evidence vs derived interpretation

TRACE must preserve the distinction:

```text
SOURCE EVIDENCE != DERIVED CLAIM
```

Examples of source evidence:

- visible human directives;
- tool outputs;
- Git commits, diffs, PR metadata;
- runtime/deployment probes;
- test output;
- explicit human decisions.

Examples of derived records:

- summaries;
- reconstructed causal links;
- velocity metrics;
- classifications;
- claims that several findings represent one failure class.

Derived records must point back to source evidence and remain replaceable.

## Retrospective capture rule

TRACE may be attached after a run has already begun.

When reconstructing the earlier portion:

```text
RETROSPECTIVE RECONSTRUCTION != LIVE OBSERVATION
```

The capture must explicitly state:

- when TRACE became attached;
- which records are retrospective;
- which evidence sources support them;
- what could not be recovered;
- which chronology fields come from source timestamps versus reconstruction order.

No historical event may be rewritten as if TRACE observed it live.

## Hidden reasoning boundary

Hidden model chain-of-thought is out of scope.

TRACE may capture:

- visible rationale explicitly emitted by an assistant;
- tool calls and results when available;
- decisions, findings, tests, diffs and outcomes.

It must not claim access to hidden reasoning that was never exposed as source evidence.

## Failure semantics

TRACE is not allowed to become a single point of failure for the development method.

```text
TRACE UNAVAILABLE != AUTOMATIC LOOP FAILURE
```

However:

```text
MISSING REQUIRED TRACE EVIDENCE
→ NO FULL RECONSTRUCTABILITY CLAIM
```

A workload MAY make observation mandatory when auditability is itself a frozen requirement. In that case the workload must say so explicitly.

## Observer / Governor separation

```text
TRACE OBSERVER != GOVERNOR
```

TRACE does not decide:

- whether a finding is severe enough to fix;
- whether a candidate wins METEOR;
- whether an incumbent survives DARWIN;
- whether a deployment is safe to promote;
- whether work should continue or stop.

Those remain Ultimate Loop / workload / human authority decisions.

A future governor may consume TRACE data, but that is a separate responsibility and must survive its own Raison d'être / METEOR challenge.

## Recommended metrics

Metrics are derived records, never source truth by themselves.

Useful metrics include:

- finding velocity;
- fix velocity;
- finding reopen rate;
- invariant promotion rate;
- regression-test accumulation;
- human intervention count;
- time to external-evidence boundary;
- model/API/token/cost usage when available;
- cost per resolved material risk.

## PHOENIX relationship

PHOENIX defines the continuity obligation: enough memory must survive to reconstruct the human-important outcome after implementations, providers, tools, or the creator disappear.

TRACE provides one evidence-preservation mechanism for that obligation.

```text
PHOENIX = WHY CONTINUITY MUST SURVIVE
TRACE   = HOW MATERIAL HISTORY MAY BE PRESERVED
```

TRACE itself remains replaceable.

## v0 acceptance boundary

TRACE Observation Layer v0 is acceptable when:

1. Ultimate Loop remains operable without TRACE authority.
2. Material transitions have a minimal event vocabulary.
3. source evidence and derived interpretation remain distinct.
4. retrospective capture cannot masquerade as live capture.
5. hidden chain-of-thought is explicitly excluded.
6. observation failure cannot silently become an evidence-success claim.
7. PHOENIX continuity can consume TRACE records without making TRACE immortal.

## Initial dogfood

The first attached run is the 2026-08-16 WebAI-Bridge development episode. The earlier portion is reconstructed from surviving GitHub evidence; capture becomes live at the human decision to integrate TRACE and continue Ultimate Loop.

Canonical TRACE implementation/evidence repository:

- https://github.com/nobutakayamauchi/TRACE
