# Exposure Gate

Status: `CANONICAL_EXTENSION / CROSS_CUTTING / HUMAN_AUTHORITY`

## Purpose

Ultimate Loop must not assume that an artifact which was safe to develop publicly should remain public forever.

The **Exposure Gate** is a cross-cutting Human Gate that re-evaluates the publication boundary when a project accumulates material commercial value, reusable proprietary know-how, protected user assets, security-sensitive implementation detail, or a credible path to paid distribution.

It is not a fourth destruction loop.

```text
PUBLIC ONCE != PUBLIC FOREVER
```

The gate exists to answer one question:

> **What should remain visible, and what should become closed before the next publication or commercial step?**

## Trigger conditions

Run the Exposure Gate when any of the following becomes materially true:

- paid distribution, licensing, subscription, service, or monetization becomes credible;
- an external user, buyer, creator, customer, or partner is about to be onboarded;
- the project approaches Beta, Production Candidate, public release, or another external distribution boundary;
- the repository contains reusable Skills, prompts, Knowledge, routing logic, orchestration, proprietary operating procedures, or other assets whose direct copying would materially reduce product value;
- the repository contains commercial control-plane logic such as payment, entitlement, revocation, pricing, metering, anti-abuse, deployment, rollback, or customer-management logic;
- source disclosure increases attack surface or reveals security-sensitive implementation detail beyond what is needed for public verification;
- public and private responsibilities have become mixed in one repository;
- a human explicitly reports that copying or redistribution would now be materially harmful;
- WATCH detects that a previously reasonable public boundary has become inappropriate because the product, threat model, market, or licensing strategy changed.

A trigger starts review. It does not decide the result.

## Required decision

The Human Gate selects one of three exposure states:

```text
PUBLIC
SPLIT
PRIVATE
```

### PUBLIC

Use when public inspectability, reproducibility, research value, ecosystem adoption, interoperability, trust, or intentional open/source-available distribution outweighs the cost of disclosure.

Public status must be deliberate, not inherited by inertia.

### SPLIT

Use when public evidence and discoverability are valuable but the operational or commercial core should not be directly redistributable.

Typical form:

```text
PUBLIC SHOWCASE / EVIDENCE / SPEC / SDK / CATALOG
+
CLOSED CORE / PRIVATE OPERATIONS / PROPRIETARY ASSETS
```

The public side may include:

- product description and positioning;
- screenshots and demos;
- verified capability/evidence summaries;
- public interfaces and schemas intentionally meant for integration;
- non-sensitive acceptance criteria;
- release notes;
- licensing and purchase/onboarding instructions.

The closed side may include:

- commercial runtime implementation;
- proprietary Skills / Knowledge / prompt assets;
- internal orchestration and routing logic;
- security-sensitive controls;
- customer-specific or secret-bearing configuration;
- deployment/rollback internals when disclosure is not justified;
- future competitive implementation work.

### PRIVATE

Use when the repository itself is primarily a proprietary product, customer asset, security-sensitive implementation, confidential operation, or otherwise has no sufficient public-value reason to remain inspectable.

## Human authority

The Exposure Gate may warn, classify evidence, and recommend a boundary, but it must not automatically change repository visibility, delete public history, alter licensing, or hide evidence.

```text
EXPOSURE WARNING != VISIBILITY MUTATION AUTHORITY
RECOMMEND SPLIT != AUTOMATIC PRIVATE
```

A visibility or licensing mutation is a separate explicit Human Gate.

## Minimum review packet

A useful Exposure Gate review records:

```text
subject
current_exposure
trigger
commercial_or_public_value
copyability / reconstruction risk
security / privacy risk
public evidence value
license status
known mirrors / historical publication
recommended_state: PUBLIC | SPLIT | PRIVATE
required_migration_actions
human_decision
reviewed_at
```

Unknowns remain explicit.

## Split completeness rule

A `SPLIT` decision is not complete merely because a private repository exists.

Before the old public source is treated as safely split, verify at least:

1. the private canonical core exists and future core development points there;
2. public links needed for product discovery/evidence have a surviving destination;
3. the public surface does not unintentionally contain a second reconstructable copy of the closed core;
4. secrets and credentials are not present in either current files or relied-upon history;
5. licensing and README language match the intended exposure model;
6. deployment/build automation does not still depend on the soon-to-be-hidden public source unless intentionally authorized;
7. public documentation does not falsely claim that hidden capabilities are independently inspectable.

```text
PRIVATE REPO CREATED != SPLIT COMPLETE
```

## Historical-publication rule

Changing visibility does not erase prior disclosure.

```text
PRIVATE NOW != NEVER PUBLIC
DELETE FROM HEAD != ERASE ALL COPIES
```

If material source, credentials, keys, or proprietary assets were previously public:

- assume cloning/mirroring may already have occurred;
- rotate exposed credentials/secrets rather than relying on deletion;
- do not make false secrecy claims about already-published versions;
- protect future revisions and the current commercial delta;
- retain enough lineage to explain what was historically public when that fact matters.

The objective is to stop unnecessary future disclosure, not to pretend history did not happen.

## License boundary

Repository visibility and legal permission are separate states.

```text
PUBLICLY READABLE != LICENSED FOR REUSE
PRIVATE != AUTOMATICALLY PROTECTED FROM PRIOR LICENSE GRANTS
```

The gate must record the current license posture when commercial or redistribution risk matters. License changes require their own deliberate review and cannot silently revoke rights already granted where such revocation is legally ineffective.

## WATCH integration

Exposure is a movable boundary.

WATCH should reopen the Exposure Gate when material changes occur in:

- monetization or distribution intent;
- product maturity;
- accumulated proprietary assets;
- customer/partner obligations;
- security threat model;
- competitor/reconstruction risk;
- licensing strategy;
- public-evidence requirements.

```text
PUBLIC ONCE != PUBLIC FOREVER
PRIVATE ONCE != PRIVATE FOREVER
```

A later decision may reopen a private component if interoperability, ecosystem value, commoditization, trust, supersession, or deliberate open-source strategy makes disclosure superior.

## Relationship to the three destructions

The Exposure Gate does not decide necessity, implementation fitness, or incumbency.

- **Raison d'être** decides whether the responsibility should exist.
- **METEOR** decides which implementation survives the frozen workload.
- **DARWIN** decides whether the incumbent still deserves its slot.
- **Exposure Gate** decides the publication boundary for the surviving artifact at a relevant external/commercial boundary.

```text
EXPOSURE GATE != FOURTH DESTRUCTION
EXPOSURE GATE != METEOR
EXPOSURE GATE != DARWIN
EXPOSURE GATE != SALES AUTHORITY
```

## DA / Counter-DA

### DA — reasons to reject a permanent exposure mechanism

1. **Secrecy by default can destroy open-development value.** Public source can create trust, reproducibility, contribution, adoption, and durable evidence.
2. **Commercial intent does not automatically imply private source.** Open-source and source-available business models can be deliberate winners.
3. **Automatic privacy changes are dangerous.** They can break deployment, Pages, integrations, collaboration, package consumers, or evidence links.
4. **Visibility is not licensing.** Treating Private as a legal control can produce false confidence.
5. **Late closure cannot undo prior publication.** A mechanism that promises retroactive secrecy would be dishonest.
6. **The gate can become bureaucracy.** Running it on every commit would create friction without changing any material boundary.
7. **Over-classification can hide security research or proof needed by customers.** Closed source can reduce external scrutiny.

### Counter-DA — surviving minimal responsibility

The responsibility survives only as a **material-triggered, cross-cutting Human Gate**:

- no automatic repository mutation;
- no private-by-default rule;
- no fourth loop;
- review only on material exposure triggers;
- explicit `PUBLIC / SPLIT / PRIVATE` outcomes;
- visibility and licensing remain separate;
- prior-public history remains acknowledged;
- `SPLIT` must preserve public evidence without leaving a second copy of the commercial core;
- WATCH may reopen the decision when reality changes.

### Verdict

`PASS / MINIMAL CROSS-CUTTING INTEGRATION AUTHORIZED`

The gate closes a real failure mode without changing Ultimate Loop's three-destruction architecture.

## Hard invariants

```text
PUBLIC ONCE != PUBLIC FOREVER
PRIVATE ONCE != PRIVATE FOREVER
PUBLICLY READABLE != LICENSED FOR REUSE
PRIVATE NOW != NEVER PUBLIC
PRIVATE REPO CREATED != SPLIT COMPLETE
EXPOSURE WARNING != VISIBILITY MUTATION AUTHORITY
EXPOSURE GATE != FOURTH DESTRUCTION
```
