# External Capability Feed — DA / Counter-DA

Date: 2026-08-19
Status: `DA_PASS / COUNTER_DA_PASS / MINIMAL_INTEGRATION_AUTHORIZED`
Subject: adding a continuously refreshed external-capability signal path to Ultimate Loop.

## Proposed change

Formalize a replaceable **External Capability Feed** that supplies current external capability changes into the existing discovery/WATCH/DARWIN path.

The feed may observe material changes in:

- models and agent capabilities;
- APIs, SDKs, MCP/tool integrations and provider-native features;
- OSS/packages and hosted services;
- new partnerships/integrations that create a materially new capability;
- pricing, availability, limits and deprecations;
- security/reliability changes;
- platforms, infrastructure and workflow tools.

The feed does **not** decide what wins. It only supplies challenger signals and evidence for the existing loops.

---

## DA — strongest reasons to reject the change

### DA-01 — It risks creating a fourth loop
Ultimate Loop is intentionally built around three destructions. A standing External Capability mechanism could become an additional governance loop beside Raison d'être, METEOR and DARWIN.

### DA-02 — It can destroy convergence
If every new release, partnership or announcement reopens the architecture, the method can thrash forever and never allow a stable occupant to remain stable.

### DA-03 — Announcement != capability
Marketing pages, release posts, preview features and partner announcements can be incomplete, unavailable, region-limited, unstable or materially different from the claimed capability.

### DA-04 — Freshness can become recency bias
"Newest" can be mistaken for "better". A newer external system can have worse whole-life fitness, migration cost, privacy, recoverability or evidence maturity.

### DA-05 — Scanner/controller creep
A feed can justify a permanent crawler, scheduler, database, normalizer, scoring service and control plane, recreating the exact scaffold Ultimate Loop tries to kill.

### DA-06 — The feed could become promotion authority
A high score or strong claim from an external source could silently bypass the frozen workload, METEOR comparison, deployment evidence or DARWIN knockout rules.

### DA-07 — Missing coverage can create false confidence
No alert does not mean nothing changed. Search/feed gaps, stale sources or provider visibility limits can create a false "no challenger exists" conclusion.

### DA-08 — Network dependence can corrupt the core
Ultimate Loop must remain usable for offline/library work and cannot require a live external feed to perform every development decision.

### DA-09 — Cost and privacy can expand without bound
Continuous external scanning can burn tokens/API calls and may tempt the system to leak private workloads to external search or comparison services.

### DA-10 — Recursive self-challenge can become pathological
If Ultimate Loop continuously challenges Ultimate Loop with every new development methodology, it can enter an unbounded self-modification cycle.

### DA verdict

**REJECT** a mandatory new loop, crawler, controller or promotion engine.

A raw "always-on external scanner" would damage the method.

---

## Counter-DA — can the responsibility survive without breaking the method?

### C-01 — The responsibility already exists semantically
Canonical Ultimate Loop already requires a Current Discovery Sweep before superiority claims, WATCH after promotion, and DARWIN when a credible challenger or era change appears. The missing piece is not a new decision loop; it is an explicit **challenger-supply path** between current external reality and those existing responsibilities.

### C-02 — Treat it as cross-cutting input, not authority
The feed produces `SIGNAL`, never `WINNER` or `PROMOTE`.

```text
EXTERNAL SIGNAL
!= VERIFIED CAPABILITY
!= METEOR WIN
!= DARWIN WIN
!= PROMOTION AUTHORITY
```

### C-03 — Materiality prevents thrash
A signal is ignored unless it plausibly maps to a frozen responsibility/current occupant and could materially change whole-life fitness, necessity, architecture or risk.

Repeated news about the same capability does not reopen the loop without materially new evidence.

### C-04 — Fresh verification defeats hype
A material signal must preserve source/provenance/freshness and be rechecked against current authoritative evidence before it can become a challenger candidate.

Provider announcement alone is evidence that a claim exists, not proof that the claimed capability works for the frozen workload.

### C-05 — Existing three-loop authority remains intact
- Pre-build: Feed → Gate 0 → Raison d'être.
- Candidate comparison: Feed may surface a candidate → METEOR still decides implementation fitness.
- Post-promotion: Feed → WATCH → material challenger → DARWIN.

No fourth loop is added.

### C-06 — No owned crawler requirement
The responsibility can be discharged by replaceable search engines, official release feeds, GitHub/package registries, provider docs, human research, AI-assisted research, scheduled checks or event-driven sources.

Ultimate Loop owns the **responsibility to refresh reality**, not a particular scanner implementation.

### C-07 — Missing/stale feed fails open to UNKNOWN, not false absence

```text
NO FEED HIT != NO EXTERNAL CHANGE
STALE FEED != CURRENT LANDSCAPE
```

Before a material superiority or replacement claim, the existing Gate 0 targeted current sweep remains authoritative.

### C-08 — Offline operation survives
The feed is not required for every loop execution. Offline work may proceed with bounded known evidence, while any claim dependent on current external superiority remains UNKNOWN or explicitly stale until a refresh is possible.

### C-09 — Bounded operation prevents cost explosion
Feed breadth, cadence, sources and retention are workload-scoped. It should prefer metadata/signals first and only deepen research for material candidates.

### C-10 — Self-evolution remains bounded
Ultimate Loop may receive external methodology challengers through the same feed, but supersession still requires the existing Supersession Rule and evidence. A new idea does not authorize self-rewrite.

---

## Surviving minimal integration

The change survives only in this form:

```text
EXTERNAL CAPABILITY FEED
= replaceable challenger-supply layer
= inputs to Gate 0 + WATCH/DARWIN
!= fourth loop
!= mandatory crawler
!= standing governor
!= promotion authority
```

Minimum signal record:

```text
source
observed_at
capability_or_change
target_responsibility_or_slot
claimed_material_delta
freshness
verification_state
raw_evidence_ref
```

Optional triage state:

```text
IGNORE / WATCH / VERIFY / CHALLENGE
```

These states are triage only. `CHALLENGE` means "run the existing applicable loop", not "replace the incumbent".

---

## Core-invariant check

The integration is accepted only if all remain true:

1. Ultimate Loop still has exactly **three destructions**.
2. `NO CURRENT LANDSCAPE SWEEP → NO SUPERIORITY CLAIM` remains true.
3. `DISCOVERY != METEOR WIN != PROMOTION AUTHORITY` remains true.
4. WATCH remains observation/triggering, not automatic replacement.
5. DARWIN remains the post-promotion replacement authority.
6. Raison d'être still tries externalization/composition before custom build.
7. Ultimate Loop does not require an owned crawler or provider-specific feed.
8. Missing feed coverage cannot be interpreted as proof that no challenger exists.
9. Offline/library workloads remain valid.
10. Ultimate Loop itself remains challengeable but not recursively self-modifying without the Supersession Rule.

## Counter-DA verdict

**PASS — MINIMAL INTEGRATION AUTHORIZED.**

The responsibility strengthens existing Gate 0 / WATCH / DARWIN behavior without altering the three-destruction architecture, provided the feed remains replaceable, bounded and non-authoritative.
