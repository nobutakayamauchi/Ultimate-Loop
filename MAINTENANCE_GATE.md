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
CANDIDATE_WORKFLOW != TRUSTED_SELF_ATTESTATION
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

## 4. Trusted WATCH boundary

A candidate that changes Ultimate Loop must not be allowed to execute its own modified WATCH logic with privileged notification authority and then cite that result as trusted evidence.

For the current GitHub V1 implementation, pull-request detection therefore runs from the **trusted base/default-branch workflow context** and inspects candidate metadata without checking out or executing candidate code.

Preferred GitHub pattern:

```text
pull_request_target
-> workflow definition from trusted base branch
-> read PR base/head identity + changed-file metadata through GitHub API
-> DO NOT checkout candidate
-> DO NOT source candidate scripts
-> DO NOT execute candidate Actions/code
-> create/update maintenance record only
```

This pattern must remain narrowly scoped because `pull_request_target` can carry privileged repository authority. The WATCH job may inspect metadata and write its notification record, but must not execute untrusted candidate content.

```text
CANDIDATE_CAN_CHANGE_WATCH != CANDIDATE_CAN_ATTEST_ITS_OWN_WATCH
PRIVILEGED_WATCH != PERMISSION_TO_EXECUTE_CANDIDATE_CODE
```

## 5. Recommendation states

Every maintenance candidate is classified as exactly one of:

```text
WATCH_ONLY
MAINTENANCE_REVIEW_REQUIRED
PAID_MAINTENANCE_RECOMMENDED
BLOCKED_UNKNOWN
```

Anything except `WATCH_ONLY` creates or updates a human-visible maintenance record.

## 6. Notification packet

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

## 7. Human authorization envelope

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

## 8. Technical spend boundary

A workflow-level intent such as `max_budget_usd=5` is not itself proof of a USD 5 hard cap.

Before a paid run is treated as authorized, evidence must show either:

1. a provider/project hard spend boundary suitable for the authorized envelope; or
2. another technically enforced equivalent bound whose failure mode is fail-closed.

The paid workflow must additionally bound at least attempts, model/runtime, execution time, retries, and mutation authority.

If the provider hard-cap behavior is unavailable, stale, soft-only, or unverified, the correct state is `BLOCKED` unless the human explicitly authorizes a different bounded risk envelope.

`DASHBOARD_BUDGET != PROVEN_HARD_CAP`.

## 9. V1 technical split

### `maintenance-watch`

- automatic on material method/control changes and optionally scheduled as a cheap backstop;
- on pull requests, executes from a trusted base/default-branch context rather than the candidate workflow;
- does not checkout or execute candidate content in the privileged notification job;
- no OpenAI/API paid secret;
- no paid runtime invocation;
- read-only repository/PR metadata access except a narrowly scoped notification-record write;
- deterministic/current evidence only;
- creates/updates a maintenance notification record.

### `maintenance-paid`

- `workflow_dispatch` only in normal operation;
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

## 10. First-install bootstrap boundary

The current GitHub implementation has a real bootstrap constraint: `workflow_dispatch` only receives manual-dispatch events when the workflow file exists on the repository's default branch. A newly introduced `maintenance-paid` workflow therefore cannot prove its own pre-merge manual Runtime path merely by existing on a feature branch.

Do not hide this as a PASS. The first installation has a distinct state:

```text
BOOTSTRAP_CANDIDATE
-> DESIGN / STATIC / INDEPENDENT REVIEW
-> HUMAN DECISION TO INSTALL DORMANT CONTROL PLANE
-> MERGE/INSTALL ON DEFAULT BRANCH
-> BOOTSTRAP_INSTALLED_NOT_RUNTIME_VERIFIED
-> TRUSTED MAIN PUSH WATCH CREATES EXACT MAINTENANCE PACKET
-> HUMAN CONFIGURES/CONFIRMS SPEND BOUNDARY + AUTHORIZES EXACT INSTALLED CANDIDATE
-> DEFAULT-BRANCH maintenance-paid DISPATCH
-> DA -> COUNTER-DA -> INDEPENDENT REALITY VERIFIER
-> MAINTENANCE_PASS => ACTIVE
-> FAIL/BLOCKED => REVERT OR NEW CANDIDATE; NOT ACTIVE
```

The bootstrap merge/install is **not** a maintenance PASS and must never be represented as one.

Before a dormant bootstrap install is allowed:

- the paid workflow must have no automatic paid trigger;
- WATCH and paid secrets must remain separated;
- no payment/account credit may trigger execution;
- the candidate must have survived design/static and independent review available before install;
- the human must explicitly accept that Runtime verification is deferred until the workflow exists on default branch;
- paid/self-maintenance promotion authority remains blocked until post-install exact-candidate Reality PASS;
- a failed post-install verification requires revert or a new candidate rather than silent continued activation.

```text
BOOTSTRAP_INSTALLED != RUNTIME_VERIFIED
BOOTSTRAP_INSTALLED != ACTIVE
```

This is a one-time/rare provider-hosting bootstrap exception, not a general excuse to merge unverified method changes.

## 11. Paid maintenance sequence

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

## 12. Retry rule

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

## 13. Candidate identity and pass lineage

Authorization and PASS bind to the exact method candidate. Record repository, base SHA, candidate SHA, tree/equivalent identity, workflow/config identity, runtime/model identity, permission profile, authorization ID, budget envelope, and verifier output.

Any material method-affecting change after PASS invalidates transfer:

`OLD_MAINTENANCE_PASS != CURRENT_CANDIDATE_PASS`.

Cleanup-only changes require an explicit lineage rule; no silent PASS transfer.

## 14. Periodic backstop

Event-driven maintenance is primary. A periodic health check may exist only as a cheap/free stale-state detector.

```text
PERIODIC_CHECK -> DETECT / NOTIFY ONLY
PERIODIC_CHECK != PAID_MAINTENANCE_AUTHORITY
```

## 15. Provider independence

OpenAI/Codex/GitHub are the current V1 implementation profile, not permanent method dependencies. Provider billing alerts are a second safety belt and never substitute for the maintenance detector or human authorization.

```text
OPENAI_BUDGET_ALERT != ULTIMATE_LOOP_MAINTENANCE_SIGNAL
```

Provider-specific bootstrap constraints must remain explicit and replaceable; they do not become permanent Ultimate Loop semantics.

## 16. Human-facing rule

> **Ultimate Loop may notice that it needs maintenance. It may ask. It may not take the wallet.**
>
> **Ultimate Loopは、自分に整備が必要だと気づいてよい。頼んでもよい。ただし、財布を勝手に持っていってはいけない。**

Design lineage and the longer pre-canonical specification are preserved in [MAINTENANCE_AUTHORIZATION_BUDGET_GATE.md](MAINTENANCE_AUTHORIZATION_BUDGET_GATE.md).