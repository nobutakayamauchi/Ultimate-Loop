# External Capability Feed

Status: `CANONICAL_EXTENSION / CROSS_CUTTING / REPLACEABLE / NON_AUTHORITATIVE`

## Purpose

Ultimate Loop must not make architecture or replacement decisions from a stale picture of the outside world.

The **External Capability Feed** is a replaceable challenger-supply layer that refreshes material changes in external capabilities and routes them into the existing **Current Discovery Sweep**, **WATCH**, and **DARWIN** responsibilities.

It is not a fourth loop.

```text
EXTERNAL CAPABILITY FEED
→ challenger signal / evidence
→ Gate 0 or WATCH
→ existing Raison d'être / METEOR / DARWIN path when material
```

## What it may observe

- model/agent capability changes;
- APIs, SDKs, tools, MCP/integration surfaces and provider-native features;
- OSS/packages and hosted services;
- partnerships/integrations that create a materially new reachable capability;
- price, quota, availability and licensing changes;
- degradation, deprecation, shutdown or provider-policy changes;
- security/reliability changes;
- new implementation patterns or development protocols;
- new failure classes relevant to current occupants.

## What Ultimate Loop owns

Ultimate Loop owns the responsibility to **refresh current external reality before claiming superiority or preserving an incumbent by inertia**.

It does not own a particular crawler, search engine, feed vendor, model, scheduler, database or monitoring stack.

```text
OWN RESPONSIBILITY
NOT IMPLEMENTATION
```

The feed may be discharged by any bounded combination of:

- official release notes and documentation;
- provider feeds/APIs;
- GitHub/package registries;
- search engines;
- human research;
- AI-assisted research;
- scheduled checks;
- event-driven notifications;
- replaceable third-party monitoring tools.

## Signal contract

A useful signal should preserve at least:

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

Optional triage:

```text
IGNORE
WATCH
VERIFY
CHALLENGE
```

`CHALLENGE` only means that an existing applicable Ultimate Loop stage should be reopened. It does not mean replacement is authorized.

## Materiality rule

The feed should not reopen work for novelty alone.

A signal becomes material only when it plausibly changes at least one frozen responsibility/current occupant on dimensions such as:

- necessity;
- whole-life capability/quality;
- operator burden;
- reliability;
- security/privacy;
- maintainability;
- cost;
- migration/rollback;
- recoverability;
- provider/dependency risk;
- evidence maturity;
- architecture fitness.

Repeated coverage of the same capability is deduplicated unless materially new evidence changes the claim.

```text
NEW != BETTER
LOUD != MATERIAL
REPEATED != NEW EVIDENCE
```

## Evidence and freshness

External news is not runtime proof.

```text
ANNOUNCEMENT != AVAILABLE CAPABILITY
AVAILABLE CAPABILITY != FROZEN-WORKLOAD FIT
DISCOVERY != METEOR WIN
DISCOVERY != DARWIN WIN
DISCOVERY != PROMOTION AUTHORITY
```

A material signal must retain source/provenance/freshness and should be checked against the strongest current authoritative source practical before it is treated as a real challenger candidate.

If freshness or coverage is insufficient:

```text
NO FEED HIT != NO EXTERNAL CHANGE
STALE FEED != CURRENT LANDSCAPE
```

The result is `UNKNOWN / NEEDS_REFRESH`, not "no challenger exists".

## Where it enters Ultimate Loop

### Before building

```text
External Capability Feed
→ Current Discovery Sweep
→ Raison d'être Destroy
```

A newly available external capability may eliminate the need to build, permit composition/glue, or expose a better architecture candidate.

### During candidate comparison

The feed may surface external candidates, but METEOR still compares them against the same frozen workload and inherited safety/evidence/recovery obligations.

### After promotion

```text
STABLE CORE / MOVABLE FRAME
→ WATCH + External Capability Feed
→ material challenger signal
→ DARWIN Arena
```

No implementation gains immunity because it was previously promoted.

## Cadence

There is no universal mandatory polling interval.

Cadence is scoped to volatility, consequence and cost. A fast-moving AI/API surface may justify frequent or event-driven checks; a stable offline/library dependency may justify infrequent or manual refresh.

Periodic challenger sweeps remain useful even when event-driven feeds exist because feed coverage can be incomplete.

Before a material superiority/replacement claim, Gate 0's targeted current sweep remains required.

## Boundedness

External monitoring must remain bounded by explicit limits such as:

- source set;
- cadence;
- time/token/API budget;
- retained history;
- target responsibilities/occupants;
- privacy/secret boundary;
- escalation depth.

Signals should be cheap first. Deep research is reserved for material candidates.

The feed must not send private frozen workloads or secrets to external services without explicit authority.

## Offline and degraded operation

Ultimate Loop remains operable without a live feed.

If a task depends on current external superiority and the feed/current sweep is unavailable, the method may proceed only with an explicit stale/unknown boundary. Offline/library work does not fabricate a live landscape.

## Ultimate Loop self-evolution

The feed may also surface development methods that challenge Ultimate Loop itself.

That does not authorize automatic self-modification.

```text
NEW METHOD SIGNAL
→ verify
→ Supersession Rule / applicable Ultimate Loop challenge
→ evidence
→ yield only if superiority is established
```

## Hard boundaries

- `EXTERNAL CAPABILITY FEED != FOURTH LOOP`;
- `FEED != GOVERNOR`;
- `FEED HIT != VERIFIED CAPABILITY`;
- `NEW != BETTER`;
- `NO FEED HIT != NO EXTERNAL CHANGE`;
- `DISCOVERY != PROMOTION AUTHORITY`;
- no owned crawler is required;
- no provider-specific feed becomes canonical;
- a new capability cannot bypass Raison d'être, METEOR, Reality Gate or DARWIN;
- Ultimate Loop remains usable without a live feed.

## DA lineage

The integration was accepted only after explicit DA / Counter-DA confirmed that the feed can strengthen current-reality discovery without creating a fourth loop, mandatory scanner or standing promotion authority.

See [EXTERNAL_CAPABILITY_FEED_DA_2026-08-19.md](EXTERNAL_CAPABILITY_FEED_DA_2026-08-19.md).
