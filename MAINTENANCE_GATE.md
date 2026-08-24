# Ultimate Loop Maintenance Gate

Status: `CANONICAL CANDIDATE / CROSS-CUTTING / FAIL-CLOSED`

The **Maintenance Gate** constrains maintenance of Ultimate Loop itself. It lets WATCH detect that the method may need inspection, lets a human receive a maintenance recommendation, and permits paid model/runtime work only inside an explicitly authorized budget envelope bound to an exact candidate.

It is a WATCH/self-evolution control profile, not a fourth destruction loop, not a permanent paid agent, and not promotion authority.

> **Detect cheaply. Notify clearly. Spend only with human authority. Verify independently. Stop automatically.**

## 1. Core authority invariants

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
FAILED_PAID_ATTEMPT != PERMISSION_TO_RETRY
BUDGET_EXHAUSTED != PERMISSION_TO_RECHARGE
OLD_MAINTENANCE_PASS != CURRENT_CANDIDATE_PASS
```

Paid maintenance requires all of:

```text
EXACT_CANDIDATE
+ EXPLICIT_HUMAN_AUTHORIZATION
+ BOUNDED_BUDGET_ENVELOPE
+ ALLOWED_MODEL/RUNTIME
+ TECHNICAL_PERMISSION_BOUNDARY
= PAID_MAINTENANCE_AUTHORIZED
```

Any missing required condition is `BLOCKED`.

## 2. Trigger classes

WATCH may create a maintenance candidate when Ultimate Loop itself receives a material change or challenge, including:

1. canonical method/gate/evidence semantics change;
2. `/goal`, agent routing, specialist ordering, independence, or mutation authority changes;
3. Codex/model/provider/runtime/authentication/tool contract changes;
4. repeated false-PASS, stale-evidence, routing, retry, or verifier failures;
5. security/exposure changes affecting the method or its execution path;
6. an external capability that could materially simplify or obsolete a method responsibility;
7. unexpected paid-runtime invocation, cost increase, retry, spend-control failure, or budget alert;
8. an explicit human request for method inspection.

`NEW_EXTERNAL_CAPABILITY != MAINTENANCE_REQUIRED`.

## 3. Cheap-first detector

The detector must obey Raison d'être and should prefer:

```text
DETERMINISTIC / FREE SIGNALS
-> EXISTING REPOSITORY / CI / WATCH EVIDENCE
-> EXISTING EXTERNAL CAPABILITY FEED
-> OPTIONAL BOUNDED TRIAGE
-> PAID MODEL ONLY AFTER HUMAN AUTHORIZATION
```

The detector has no repair, payment, secret, or promotion authority.

```text
DETECTOR != REPAIRER != VERIFIER
```

A WATCH implementation should not receive the paid-provider secret merely so it can decide whether paid maintenance might be useful.

## 4. Recommendation states

Every maintenance candidate is classified as exactly one of:

```text
WATCH_ONLY
MAINTENANCE_REVIEW_REQUIRED
PAID_MAINTENANCE_RECOMMENDED
BLOCKED_UNKNOWN
```

Anything except `WATCH_ONLY` creates or updates a human-visible maintenance record.

## 5. Notification packet

The notification record must contain at least:

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

It must say explicitly that paid work has **not** started.

GitHub Issue + ordinary GitHub notification/email is the preferred V1 transport because it leaves a repository evidence record without adding SMTP/Gmail credentials. Email delivery, notification delivery, and human reading remain distinct states.

`EMAIL_SENT != EMAIL_DELIVERED != HUMAN_READ != HUMAN_AUTHORIZATION`.

## 6. Human authorization envelope

Authorization must bind to:

```text
MAINTENANCE_ID
EXACT_CANDIDATE_SHA
MAX_BUDGET_USD
MODEL/RUNTIME ALLOWLIST
MAX_PAID_ATTEMPTS
EXPIRY
```

Current operating profile:

```text
DEFAULT_MAX_PAID_MAINTENANCE_BUDGET_USD = 5.00
DEFAULT_MAX_PAID_ATTEMPTS_PER_CANDIDATE = 1
DEFAULT_MODEL = gpt-5.6-sol
DEFAULT_REASONING_EFFORT = high
AUTO_RECHARGE = OFF
AUTO_RETRY = OFF
```

The USD 5 amount, model name, and reasoning effort are replaceable operating-profile values, not eternal method invariants.

Payment is a resource condition, not an authority condition. Funding the API account or project alone never starts maintenance.

## 7. Technical spend boundary

A workflow-level intent such as `max_budget_usd=5` is not itself proof of a USD 5 hard cap.

Before a paid run is treated as authorized, evidence must show either:

1. a provider/project hard spend boundary suitable for the authorized envelope; or
2. another technically enforced equivalent bound whose failure mode is fail-closed.

The paid workflow must additionally bound at least attempts, model/runtime, execution time, retries, and mutation authority.

If the provider hard-cap behavior is unavailable, stale, soft-only, or unverified, the correct state is `BLOCKED` unless the human explicitly authorizes a different bounded risk envelope.

`DASHBOARD_BUDGET != PROVEN_HARD_CAP`.

## 8. V1 technical split

### `maintenance-watch`

- automatic on material method/control changes and optionally scheduled as a cheap backstop;
- no OpenAI/API paid secret;
- no paid runtime invocation;
- read-only repository access except a narrowly scoped notification-record write;
- deterministic/current evidence only;
- creates/updates a maintenance notification record.

### `maintenance-paid`

- `workflow_dispatch` only;
- exact candidate SHA required;
- explicit typed human authorization required;
- protected GitHub Environment recommended and required before relying on environment-secret isolation;
- maintenance-only API secret name; do not reuse a broad repository `OPENAI_API_KEY` as the intended boundary;
- model allowlist and bounded reasoning profile;
- one paid attempt per candidate by default;
- no automatic retry/top-up;
- exact structured verdict;
- final Reality Verifier executes under a proven technical non-mutation boundary.

GitHub Environment approval is an additional technical belt. Manual dispatch plus the exact authorization contract remains required even when an Environment is configured.

## 9. Paid maintenance sequence

Paid maintenance reuses the existing Ultimate Loop:

```text
LOCK EXACT CANDIDATE
-> FREEZE MAINTENANCE WORKLOAD
-> RAISON D'ÊTRE
-> SMALLEST JUSTIFIED MAINTENANCE CANDIDATE
-> DEVIL'S ADVOCATE
-> COUNTER-ADVOCATE
-> INDEPENDENT REALITY VERIFIER
-> EXACT TERMINAL VERDICT
-> STOP
```

The Reality Verifier must not repair the candidate and must independently verify candidate identity, required role/gate execution, UNKNOWN/BLOCKED semantics, paid-attempt bounds, authorization identity, and observed/technical non-mutation evidence.

Possible terminal verdicts:

```text
MAINTENANCE_PASS
MAINTENANCE_FAIL
MAINTENANCE_BLOCKED
MAINTENANCE_BUDGET_EXHAUSTED
MAINTENANCE_EVIDENCE_STALE
```

No failure verdict authorizes a retry.

## 10. Retry rule

```text
PAID_ATTEMPT_FAIL
-> STOP
-> PRESERVE EVIDENCE
-> REPAIR OUTSIDE PAID VERIFICATION WHEN POSSIBLE
-> NEW CANDIDATE IDENTITY
-> NEW HUMAN AUTHORIZATION
```

Never silently enter:

```text
FAIL -> FIX -> RETRY -> FIX -> RETRY
```

## 11. Candidate identity and pass lineage

Authorization and PASS bind to the exact method candidate. Record repository, base SHA, candidate SHA, tree/equivalent identity, workflow/config identity, runtime/model identity, permission profile, authorization ID, budget envelope, and verifier output.

Any material method-affecting change after PASS invalidates transfer:

`OLD_MAINTENANCE_PASS != CURRENT_CANDIDATE_PASS`.

Cleanup-only changes require an explicit lineage rule; no silent PASS transfer.

## 12. Periodic backstop

Event-driven maintenance is primary. A periodic health check may exist only as a cheap/free stale-state detector.

```text
PERIODIC_CHECK -> DETECT / NOTIFY ONLY
PERIODIC_CHECK != PAID_MAINTENANCE_AUTHORITY
```

## 13. Provider independence

OpenAI/Codex/GitHub are the current V1 implementation profile, not permanent method dependencies. Provider billing alerts are a second safety belt and never substitute for the maintenance detector or human authorization.

```text
OPENAI_BUDGET_ALERT != ULTIMATE_LOOP_MAINTENANCE_SIGNAL
```

## 14. Human-facing rule

> **Ultimate Loop may notice that it needs maintenance. It may ask. It may not take the wallet.**
>
> **Ultimate Loopは、自分に整備が必要だと気づいてよい。頼んでもよい。ただし、財布を勝手に持っていってはいけない。**

Design lineage and the longer pre-canonical specification are preserved in [MAINTENANCE_AUTHORIZATION_BUDGET_GATE.md](MAINTENANCE_AUTHORIZATION_BUDGET_GATE.md).