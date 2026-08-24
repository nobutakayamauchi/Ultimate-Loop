# Ultimate Loop Maintenance Authorization & Budget Gate

Status: `PROPOSED / NON_CANONICAL / SPEC_ONLY`

Formal name: **Maintenance Authorization & Budget Gate**  
Short name: **Maintenance Gate**  
Informal design metaphor: **the leash / 首輪**

This document specifies how Ultimate Loop may detect that **Ultimate Loop itself** needs maintenance, notify a human, and enter paid model/runtime maintenance only after explicit human authorization under a bounded budget.

It is a cross-cutting control plane. It is **not a fourth destruction loop**, not a permanent paid watcher, and not authority for self-promotion.

---

## 1. Raison d'être

Ultimate Loop is now complex enough that changes to its own routing, gates, specialist roles, provider/runtime assumptions, evidence semantics, or external capability dependencies can themselves require destructive inspection and Reality verification.

Without a maintenance control plane, two bad extremes appear:

1. **under-maintenance** — the method silently becomes stale or internally inconsistent;
2. **runaway self-maintenance** — the method repeatedly invokes expensive models/runtimes, repairs itself, retries itself, and consumes budget without a deliberate human decision.

The Maintenance Gate exists to permit the first problem to be detected without creating the second.

Core objective:

> **Detect cheaply. Notify clearly. Spend only with human authority. Verify independently. Stop automatically.**

---

## 2. Non-goals

The Maintenance Gate does not:

- create a fourth Ultimate Loop;
- continuously run a paid OpenAI model;
- treat every repository change as maintenance-worthy;
- automatically purchase credits;
- automatically enable auto-recharge;
- treat API credit availability as permission to spend;
- let the repairer approve its own work;
- guarantee that an email was read;
- make OpenAI, GitHub, Gmail, one model, or one billing mechanism a permanent dependency;
- convert a provider billing notification into method-level maintenance evidence;
- allow `PASS UNTIL BUDGET RUNS OUT` semantics.

---

## 3. Canonical invariants proposed by this spec

```text
MAINTENANCE_SIGNAL != MAINTENANCE_REQUIRED
MAINTENANCE_REQUIRED != PAID_MAINTENANCE_AUTHORIZED
EMAIL_SENT != HUMAN_AUTHORIZATION
API_KEY_PRESENT != SPEND_AUTHORITY
API_CREDIT_AVAILABLE != SPEND_AUTHORITY
PAYMENT_COMPLETED != SPEND_AUTHORITY
HUMAN_AUTHORIZATION != PROMOTION_AUTHORITY
REPAIR_COMPLETE != REALITY_VERIFIED
LOOP_MAY_INSPECT_ITSELF != LOOP_MAY_SELF_PROMOTE
BUDGET_EXHAUSTED != PERMISSION_TO_RECHARGE
FAILED_PAID_ATTEMPT != PERMISSION_TO_RETRY
OLD_MAINTENANCE_PASS != CURRENT_CANDIDATE_PASS
SEPARATE_MODEL != AUTOMATIC_INDEPENDENCE
```

Paid execution requires all of:

```text
EXACT_CANDIDATE
+ EXPLICIT_HUMAN_AUTHORIZATION
+ BOUNDED_BUDGET_ENVELOPE
+ ALLOWED_MODEL/RUNTIME
+ TECHNICAL_PERMISSION_BOUNDARY
= PAID_MAINTENANCE_AUTHORIZED
```

Anything missing is `BLOCKED`, not implicitly approved.

---

## 4. State machine

```text
NORMAL_OPERATION
  |
  v
MAINTENANCE_WATCH
  |
  +--> NO_MATERIAL_SIGNAL --------------------------> NORMAL_OPERATION
  |
  v
MAINTENANCE_CANDIDATE
  |
  v
FREE_OR_BOUNDED_TRIAGE
  |
  +--> WATCH_ONLY ----------------------------------> NORMAL_OPERATION
  |
  +--> UNKNOWN / INSUFFICIENT_EVIDENCE ------------> NOTIFY_HUMAN
  |
  v
MAINTENANCE_RECOMMENDED
  |
  v
NOTIFY_HUMAN
  |
  v
WAITING_FOR_HUMAN_BUDGET_AUTHORIZATION
  |
  +--> REJECTED / EXPIRED --------------------------> CLOSED_NO_PAID_RUN
  |
  v
AUTHORIZED_FOR_EXACT_CANDIDATE
  |
  v
PAID_MAINTENANCE_RUN
  |
  v
DA -> COUNTER_DA -> INDEPENDENT_REALITY_VERIFIER
  |
  +--> PASS ----------------------------------------> PROMOTION_ELIGIBLE
  |
  +--> FAIL / BLOCKED / BUDGET_EXHAUSTED ----------> STOPPED
                                                        |
                                                        v
                                              NEW HUMAN DECISION REQUIRED
```

There is no automatic edge from `STOPPED` back to `PAID_MAINTENANCE_RUN`.

---

## 5. Trigger classes

Maintenance WATCH should create a candidate when one or more material triggers apply.

### T1 — Canonical method semantics changed

Examples:

- `METHOD.md` flow changes;
- a new gate is added or an existing gate changes authority;
- UNKNOWN / BLOCKED / PASS semantics change;
- promotion or evidence rules change;
- PHOENIX / TRACE / WATCH / External Capability Feed semantics change materially.

### T2 — Agent or routing semantics changed

Examples:

- `/goal` routing changes;
- specialist role responsibilities change;
- DA / Counter-DA / Reality Verifier ordering or independence changes;
- tool permissions or mutation authority change;
- a new permanent role or control-plane component is proposed.

### T3 — Runtime/provider contract changed

Examples:

- Codex runtime behavior materially changes;
- model family, reasoning controls, context behavior, or tool semantics materially change;
- GitHub Action / API authentication contract changes;
- a provider deprecates or replaces a relied-upon capability.

### T4 — Repeated internal failure signal

Examples:

- the same class of false PASS appears more than once;
- stale candidate evidence is repeatedly accepted or nearly accepted;
- route selection repeatedly conflicts with the frozen workload;
- repair loops consume excessive attempts/tokens without producing new evidence;
- independent reviewers repeatedly find method-level defects.

### T5 — Security / exposure change

Examples:

- a new internet-facing boundary is introduced;
- secrets or credentials enter a new execution path;
- the threat model changes materially;
- a security gate itself changes.

### T6 — External capability challenger

A materially better external capability may obsolete, simplify, or invalidate an Ultimate Loop responsibility.

A signal is not enough by itself:

```text
NEW_EXTERNAL_CAPABILITY != MAINTENANCE_REQUIRED
```

It must plausibly change whole-life fitness, correctness, cost, operator burden, security, independence, recoverability, or evidence quality.

### T7 — Cost/control anomaly

Examples:

- paid verification cost materially increases;
- a workflow unexpectedly invokes paid runtime;
- retries occur without human approval;
- spend-envelope enforcement fails;
- a provider budget/usage alert fires unexpectedly.

### T8 — Human explicit trigger

The human may always request a maintenance inspection regardless of automated WATCH state.

---

## 6. Cheap-first detection policy

The maintenance detector should itself obey Raison d'être.

Preferred order:

```text
DETERMINISTIC / FREE SIGNALS
-> EXISTING REPOSITORY / CI / WATCH EVIDENCE
-> EXISTING EXTERNAL CAPABILITY FEED
-> OPTIONAL BOUNDED TRIAGE
-> PAID MODEL ONLY AFTER HUMAN AUTHORIZATION
```

Examples of zero/low-cost signals:

- path-based diffs of canonical files;
- schema/contract diffs;
- changed agent configuration;
- failing or newly stale Reality evidence;
- repeated issue/failure labels;
- provider release/deprecation signals already collected by the External Capability Feed;
- candidate identity drift;
- unexpected workflow invocation;
- security/exposure path changes.

The detector may recommend maintenance but has no repair or promotion authority.

```text
DETECTOR != REPAIRER != VERIFIER
```

---

## 7. Maintenance recommendation levels

Every candidate is triaged to exactly one state:

```text
WATCH_ONLY
MAINTENANCE_REVIEW_REQUIRED
PAID_MAINTENANCE_RECOMMENDED
BLOCKED_UNKNOWN
```

### WATCH_ONLY

A signal exists but does not justify method maintenance now.

### MAINTENANCE_REVIEW_REQUIRED

Human review is needed, but paid Runtime execution is not yet justified.

### PAID_MAINTENANCE_RECOMMENDED

Evidence indicates that a paid destructive/reality run is likely justified.

### BLOCKED_UNKNOWN

The system cannot safely decide whether paid maintenance is justified. Notify the human and preserve the unknown.

---

## 8. Notification contract

When the state reaches `MAINTENANCE_REVIEW_REQUIRED`, `PAID_MAINTENANCE_RECOMMENDED`, or `BLOCKED_UNKNOWN`, send a human-readable notification.

The notification packet must include:

```text
MAINTENANCE_ID
REPOSITORY
EXACT_BASE_SHA
EXACT_CANDIDATE_SHA
TRIGGER_CLASS
AFFECTED_RESPONSIBILITY
WHY_NOW
EVIDENCE_SUMMARY
RISK_IF_IGNORED
RECOMMENDED_ACTION
RECOMMENDED_MAX_BUDGET
RECOMMENDED_MODEL/RUNTIME
AUTHORIZATION_EXPIRY
LINK_TO_EVIDENCE
```

It must not include secrets, API keys, hidden chain-of-thought, or fabricated certainty.

The ideal user-facing email is intentionally short:

```text
Subject: Ultimate Loop maintenance recommended — <MAINTENANCE_ID>

A material maintenance trigger was detected.
Candidate: <exact SHA>
Reason: <one-paragraph summary>
Paid run recommended: YES / NO / UNKNOWN
Maximum authorized budget if approved: USD <amount>

Nothing paid has started.
Review the evidence, fund the maintenance budget if needed, then explicitly authorize this exact candidate.
```

---

## 9. Notification transport

The method does not require a particular mail provider.

### V1 preferred transport

Use GitHub as the notification source of record:

1. WATCH creates or updates one issue labeled `ultimate-loop-maintenance`;
2. the issue mentions the authorized human owner;
3. normal GitHub notification/email delivery alerts the human according to their GitHub settings;
4. the issue contains the exact Maintenance Packet and authorization link/instructions.

Advantages:

- no SMTP credential is required;
- no Gmail write authority is required;
- notification and evidence remain attached to the repository;
- email delivery is replaceable while the GitHub issue remains the record.

A direct email provider may replace this transport later without changing the method contract.

---

## 10. Human authorization contract

A paid maintenance run may not begin merely because the account contains money.

Human authorization must bind to:

```text
MAINTENANCE_ID
EXACT_CANDIDATE_SHA
MAX_BUDGET_USD
MODEL/RUNTIME ALLOWLIST
MAX_PAID_ATTEMPTS
EXPIRY
```

Recommended current profile:

```text
DEFAULT_MAX_PAID_MAINTENANCE_BUDGET_USD = 5.00
DEFAULT_MAX_PAID_ATTEMPTS_PER_CANDIDATE = 1
AUTO_RECHARGE = OFF
AUTO_RETRY = OFF
```

The USD 5 value is a current operating profile, not an eternal method invariant. Changing it requires an explicit human decision and should itself be traceable.

---

## 11. Why payment alone must not unlock maintenance

The desired human experience is:

```text
EMAIL ARRIVES
-> HUMAN REVIEWS
-> HUMAN ADDS/ALLOCATES BUDGET
-> MAINTENANCE STARTS
```

The technical contract must add one more explicit step:

```text
EMAIL ARRIVES
-> HUMAN REVIEWS
-> HUMAN ADDS/ALLOCATES BUDGET
-> HUMAN AUTHORIZES EXACT CANDIDATE
-> MAINTENANCE STARTS
```

Reason:

- payment may have been made for another project;
- account credit can already exist before a maintenance event;
- billing state can be delayed;
- provider billing APIs/webhooks may change or be unavailable;
- an automatic payment-triggered self-modification path has poor blast-radius control.

Therefore:

```text
PAYMENT IS A RESOURCE CONDITION, NOT AN AUTHORITY CONDITION.
```

---

## 12. Paid execution boundary

The paid maintenance workflow should be technically separated from WATCH.

### V1 GitHub design

Use two different workflows / permission surfaces.

#### A. `maintenance-watch`

Properties:

- no `OPENAI_API_KEY` access;
- no paid provider secret access;
- read-only repository permissions where possible;
- deterministic or already-available evidence only;
- may create/update the maintenance notification record through a narrowly scoped writer if required;
- cannot invoke paid maintenance.

#### B. `maintenance-paid`

Properties:

- manual start only;
- protected GitHub Environment such as `paid-maintenance`;
- `OPENAI_API_KEY` exists only in that protected environment, not in WATCH;
- exact candidate SHA is a required input;
- human environment approval or equivalent explicit authorization is required;
- model/runtime is allowlisted;
- one paid attempt per candidate by default;
- bounded token/tool/time/retry budget;
- read-only verifier boundary;
- exact structured result contract;
- fails closed on missing evidence or budget exhaustion.

This makes the absence of paid authority a technical property, not merely a prompt instruction.

---

## 13. OpenAI billing profile — replaceable provider implementation

Current intended provider profile is a dedicated OpenAI API project, for example:

```text
Project: Ultimate-Loop-Maintenance
Purpose: paid maintenance / Reality verification only
Auto recharge: OFF
Default maintenance envelope: USD 5
Model allowlist: current approved maintenance model(s)
Spend alerts: enabled
Hard spend enforcement: enabled when provider capability supports it
```

Provider billing alerts are a second safety belt. They are **not** the maintenance detector.

```text
OPENAI_BUDGET_ALERT != ULTIMATE_LOOP_MAINTENANCE_SIGNAL
```

The system should remain correct if OpenAI changes project limits, billing UI, minimum prepaid purchase, model names, or alert behavior.

When provider hard-cap behavior is unavailable or uncertain, the workflow must retain its own bounded execution policy and fail closed rather than relying on a soft dashboard budget.

---

## 14. Paid maintenance sequence

Once authorized, the paid run uses the existing Ultimate Loop rather than inventing a meta-loop.

Suggested sequence:

```text
1. Lock exact candidate identity.
2. Freeze the maintenance workload and trigger evidence.
3. Ask Raison d'être whether the proposed maintenance responsibility/change is necessary.
4. Execute the smallest justified maintenance candidate.
5. Run Devil's Advocate.
6. Run Counter-Advocate only after DA evidence exists.
7. Run independent Reality Verifier in a clean/non-inherited context.
8. Verifier may inspect but must not repair.
9. Verify exact candidate identity and observed non-mutation boundary where applicable.
10. Emit one exact structured verdict.
```

Possible terminal verdicts:

```text
MAINTENANCE_PASS
MAINTENANCE_FAIL
MAINTENANCE_BLOCKED
MAINTENANCE_BUDGET_EXHAUSTED
MAINTENANCE_EVIDENCE_STALE
```

No terminal failure authorizes another paid attempt.

---

## 15. Retry and budget rules

### One candidate, one paid attempt by default

```text
PAID_ATTEMPT_FAIL
-> STOP
-> PRESERVE EVIDENCE
-> REPAIR OUTSIDE PAID VERIFICATION WHEN POSSIBLE
-> NEW CANDIDATE IDENTITY
-> NEW HUMAN AUTHORIZATION
```

The paid verifier must not enter:

```text
FAIL -> FIX -> RETRY -> FIX -> RETRY ...
```

without a new explicit authorization envelope.

### Budget exhaustion

When the envelope is exhausted:

```text
BUDGET_EXHAUSTED -> BLOCKED
```

Never:

```text
BUDGET_EXHAUSTED -> AUTO_TOP_UP -> CONTINUE
```

---

## 16. Candidate identity and evidence lineage

Authorization and PASS bind to the exact candidate.

At minimum record:

- repository;
- base SHA;
- candidate SHA;
- tree or equivalent immutable identity when available;
- workflow/config identity;
- model/runtime identity;
- permission profile;
- authorization ID;
- budget envelope;
- verifier output.

If method-affecting content changes after PASS:

```text
OLD_MAINTENANCE_PASS != CURRENT_CANDIDATE_PASS
```

A cleanup-only change may be handled by an explicit lineage rule, but never by silent pass transfer.

---

## 17. Independent Reality Verifier contract

The final verifier must be independent in execution semantics, not merely in role name.

Required properties:

- clean/non-inherited task context where practical;
- cannot modify the candidate under verification;
- does not receive hidden repair reasoning as authority;
- verifies exact candidate identity itself;
- verifies that required roles/gates actually executed;
- checks UNKNOWN/BLOCKED semantics;
- checks paid budget and attempt bounds;
- checks no unapproved retry occurred;
- cannot turn budget availability into authority;
- emits PASS only from current evidence.

---

## 18. Periodic health check

Event-driven maintenance is primary.

A periodic check may exist only as a bounded backstop for silent staleness.

It should initially be cheap/free and ask only whether a material maintenance candidate exists. It must not automatically launch a paid Runtime.

Recommended semantic rule:

```text
PERIODIC_CHECK -> DETECT / NOTIFY ONLY
PERIODIC_CHECK != PAID_MAINTENANCE
```

Cadence is an operating profile, not a method invariant.

---

## 19. Failure modes this gate must kill

The design is invalid if any of these become possible:

1. a README edit automatically spends API money;
2. adding API credits automatically starts self-modification;
3. WATCH can access the paid API secret;
4. the repairer can declare itself verified;
5. a failed run silently retries until PASS;
6. budget exhaustion triggers auto-recharge;
7. a PASS from an old SHA is reused after a material change;
8. an OpenAI budget email is mistaken for a maintenance recommendation;
9. no notification record exists for a paid run;
10. a paid run has no exact maximum budget or attempt count;
11. the detector becomes a permanent high-cost AI employee;
12. the Maintenance Gate becomes a fourth destruction loop.

---

## 20. V1 implementation target

V1 should be deliberately small.

Required:

- one maintenance trigger classifier;
- one durable maintenance notification packet;
- email-capable notification through an existing replaceable channel;
- one explicit human authorization action;
- protected paid secret boundary;
- exact candidate binding;
- USD 5 default envelope;
- no auto-recharge;
- no automatic paid retry;
- one paid `/goal` maintenance run;
- DA -> Counter-DA -> independent Reality Verifier;
- exact structured terminal verdict;
- evidence preservation.

Not required for V1:

- automatic detection of OpenAI credit purchase;
- custom billing webhook;
- custom SMTP service;
- permanent paid AI watcher;
- autonomous budget increase;
- autonomous merge/promotion;
- automatic repair/retry loop.

---

## 21. User experience target

The desired operating experience is:

```text
Ultimate Loop works normally.

A material self-maintenance trigger appears.

The owner receives an email:
"Ultimate Loop maintenance is recommended. Nothing paid has started."

The owner opens the evidence.

If the owner agrees:
- allocate/add the small maintenance budget;
- explicitly authorize the exact candidate.

The paid maintenance workflow starts once.

Ultimate Loop attacks the proposed change.

Independent Reality Verifier decides PASS / FAIL / BLOCKED.

The workflow stops.

No further money is spent until another explicit authorization.
```

This is the intended meaning of the "leash":

> **Ultimate Loop may notice that it needs maintenance. It may ask. It may not take the wallet.**

---

## 22. Proposed integration points

If this specification survives DA / Counter-DA and Reality review, integrate it without creating a new loop:

- `METHOD.md` — add Maintenance Gate as a cross-cutting self-maintenance control around WATCH / method changes;
- `AGENTS.md` — add paid authority and verifier separation rules;
- `.agents/skills/ultimate-loop/SKILL.md` — define maintenance trigger, notification, authorization, and bounded paid-run behavior;
- optional `maintenance-watch` workflow — zero-paid-secret detector/notifier;
- optional `maintenance-paid` workflow — protected manual paid executor;
- TRACE / PHOENIX — preserve authorization, candidate identity, verdict, and failure evidence.

The spec must not be promoted merely because it exists. It remains `NON_CANONICAL` until it survives the existing Ultimate Loop.
