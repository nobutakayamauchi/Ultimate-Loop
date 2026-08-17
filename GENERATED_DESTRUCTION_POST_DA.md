# Generated Destruction Extension — Post-Prototype DA / Counter-DA

Status: `PRE-MERGE HARDENING / SURVIVES WITH GUARDRAILS`

Subject under attack:

- `GENERATED_DESTRUCTION_EXTENSION.md`
- `EXTERNAL_CHALLENGER_SWEEP_2026-08-17.md`

The question is not whether the five external challengers contain useful ideas. The question is whether the extracted Ultimate Loop extension remains safe, bounded, reproducible, tool-neutral, and non-SimCity after those ideas are combined.

## P1 — Generated attacks can become a denial-of-service against the development process

Failure mode:

```text
schema exists
→ generator enabled
→ huge reachable input space
→ endless low-value cases
→ token/tool/runtime cost explodes
```

Counter-DA:

The Generated Attack Lane is not automatically mandatory merely because a machine-readable schema exists.

Required interpretation:

- activate it when generated exploration plausibly covers a material blind spot for the frozen workload;
- generated-case count is not progress;
- generation obeys Bounded Destruction;
- repeated equivalent failures collapse into a failure/root-cause class;
- exhaustion is `BOUND_EXHAUSTED / FRONTIER_OPEN`, never convergence.

`SCHEMA EXISTS != GENERATOR MUST RUN FOREVER`

## P2 — Shrinking can produce a different failure than the original

A minimized case may be smaller yet trigger a different oracle, race, timeout, or external failure.

Required interpretation:

- a minimized counterexample is DERIVED;
- it must reproduce the same classified property violation inside the controllable envelope before being treated as the canonical replay case;
- the original failure evidence remains preserved/referenced.

`SMALLER CASE != SAME FAILURE`

## P3 — Replay packets can accidentally archive secrets

A useful replay packet may touch API keys, bearer entitlements, cookies, credentials, payment references, private customer data, provider responses, or other sensitive material.

Required guardrail:

- replayability does not authorize secret retention;
- preserve safe identifiers, hashes, lengths, redacted forms, secret-store handles, or operator-supplied re-entry instructions where possible;
- plaintext secret capture requires separate explicit secure authority and is never the default;
- TRACE must not weaken its source/redaction boundary merely to make replay convenient.

`REPLAYABILITY != SECRET ARCHIVE AUTHORITY`

## P4 — Replay packets can become a second raw-log warehouse

Storing every generated input, stdout, response body, diff, and environmental artifact inline would create observer and storage pressure.

Required guardrail:

- keep the replay packet as a compact manifest;
- bulk artifacts may live in replaceable external storage and be referenced by durable identity/digest;
- retain only what is necessary to reconstruct the material failure under the frozen audit requirement;
- missing bulk evidence must remain visible if the referenced artifact later disappears.

`REPLAY MANIFEST != COPY THE WORLD`

## P5 — Minimal-Power Challenger could delete justified independence

A generic model + shell can look simpler than a dedicated validator, Witness, observer, safety gate, or deployment preflight while also destroying the independence that makes that role valuable.

Required guardrail:

The Minimal-Power Challenger competes on the **same frozen requirements**. If independent authority/evidence is itself a requirement, a merged generic path has not satisfied the workload.

`FEWER COMPONENTS != SAME RESPONSIBILITY`

## P6 — Minimal-Power candidate order can become ritual

The listed simple-to-specialized order is a heuristic, not a compulsory waterfall. A workload may know immediately that a manual path or generic shell cannot meet required independence, latency, safety, scale, or reproducibility.

Required interpretation:

- reject obviously non-viable simpler candidates with evidence/rationale;
- do not perform fake implementation work merely to say a simpler candidate was tried.

`CONSIDER != BUILD EVERY CANDIDATE`

## P7 — External Nemesis can destroy the wrong target

A fault-injection adapter can escape its intended sandbox through bad host identity, shared infrastructure, wrong credentials, DNS mistakes, or ambiguous target selection.

Required guardrail:

Before destructive external fault injection:

```text
TARGET IDENTITY
+ AUTHORIZED BOUNDARY
+ BLAST-RADIUS BOUND
+ RECOVERY PATH
→ NEMESIS AUTHORIZED
```

Production, third-party, shared, or ambiguous targets fail closed unless separately and explicitly authorized.

`FAULT IDEA != FAULT AUTHORITY`

## P8 — Nemesis history can contaminate causal claims

A failure occurring after a fault does not prove that fault caused it.

Required interpretation:

- operation and fault histories are source evidence;
- temporal ordering is preserved;
- causal classification remains derived;
- multiple plausible causes preserve CONFLICT/UNKNOWN until discriminated.

`AFTER FAULT != BECAUSE OF FAULT`

## P9 — Formal model checking has its own state-explosion boundary

A bounded model can fail to explore its intended state space due to resource exhaustion, configuration limits, symmetry assumptions, or reduced domains.

Required guardrail:

Model-check evidence must preserve:

- model/spec revision;
- checker/tool identity;
- relevant constants/configuration;
- explored/limited state-space evidence where available;
- stop/result reason;
- counterexample trace when present.

A resource-limited or incomplete model run cannot masquerade as a proof-like pass.

`MODEL RUN ENDED != STATE SPACE EXHAUSTED`

## P10 — Formalization can drift away from implementation

A beautiful model may validate a state machine that production no longer implements.

Required guardrail:

Formalization escalation must include an explicit mapping boundary:

```text
MODEL ASSUMPTIONS / TRANSITIONS
↔ IMPLEMENTATION / TEST / DEPLOYMENT SURFACE
```

If the mapping becomes stale or cannot be shown, the formal result remains useful design evidence but cannot be promoted as current implementation evidence.

## P11 — Seed-only replay is insufficient

A seed does not reproduce a run if code revision, generator version, schema/model revision, configuration, external state, or operation scheduling changed.

Required interpretation:

`SEED = ONE REPLAY INPUT, NOT THE REPLAY PACKET.`

A replay claim must bind the other material inputs needed by that workload.

## P12 — Bounded Destruction can be gamed by repeatedly raising the bound

A human/agent could avoid declaring non-convergence by continually increasing budgets.

Required guardrail:

- bound increases are explicit decisions;
- the previous exhaustion remains preserved;
- the reason for increasing the bound is recorded;
- cumulative resource use remains observable when practical;
- repeated bound raises without materially new perspective become an operator/governance finding, not invisible continuation.

`RAISE BOUND != ERASE EXHAUSTION`

---

## Counter-DA against the combined extension

### Does it create a fourth loop?

No. Generated attack, replay, nemesis, and formalization are challenger/evidence modes inside existing Raison d'être, METEOR, Reality Gate, DARWIN, and observation boundaries.

### Does it make any external repository mandatory?

No. Schemathesis, TigerBeetle, mini-SWE-agent, Jepsen, Hypothesis, and TLA+ are lineage/challenger sources only. The surviving rules are tool-neutral.

### Does it make fuzzing the new authority?

No. A generator discovers counterexamples; it does not grant promotion or prove absence of bugs.

### Does it make formal methods the new authority?

No. A model-check result is scoped design/challenger evidence. Real integration/deployment/device/provider evidence remains independently required.

### Does replay force collection of dangerous data?

No. Secret retention is explicitly outside default replay authority.

### Does minimality delete Witness/TRACE/validators?

Not if their independence is a frozen requirement. The simpler challenger must satisfy the same requirement set, not a weakened one.

---

## Final acceptance matrix

PASS only if all remain true:

1. Generated Attack Lane is optional/justified, bounded, and failure-class aware.
2. Shrunk cases are derived and revalidated against the same property violation.
3. Replay packets default to secret-safe manifests rather than raw-world capture.
4. Exact replay claims are limited to the captured deterministic envelope.
5. Seed alone is never treated as complete replay identity.
6. Bound exhaustion remains distinct from convergence and survives later bound increases.
7. Minimal-Power Challenger competes against the same frozen requirements.
8. External Nemesis requires target identity, authorization, blast-radius bound, and recovery path.
9. Fault occurrence and causal interpretation remain separate.
10. Formal model runs preserve scope/config/stop reason and cannot hide state-space exhaustion.
11. Formal models preserve an explicit mapping boundary to implementation.
12. No external source repository becomes a permanent core dependency.
13. TRACE remains observer, not governor.

Result: `PASS / MERGE_READY SUBJECT TO THESE GUARDRAILS`

These guardrails are normative for promotion of `GENERATED_DESTRUCTION_EXTENSION.md`; where the extension text is ambiguous, this post-DA file narrows the interpretation toward the safer bounded meaning above.
