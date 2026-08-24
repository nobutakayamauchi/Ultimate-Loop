# Security Release Gate

Status: `CANONICAL_EXTENSION / CROSS_CUTTING / FAIL_CLOSED_WHEN_REQUIRED`

## Purpose

Ultimate Loop must not confuse a working implementation, a successful build, or a security-themed AI review with evidence that an externally reachable system is safe enough to release.

The **Security Release Gate** is a cross-cutting release boundary for software that becomes internet-reachable, accepts untrusted input, touches protected data, invokes paid/privileged external services, or gives an AI/model tools or data access that an attacker could influence.

It is not a fourth destruction loop and it is not a security certification.

```text
WORKS != SAFE_TO_EXPOSE
SECURITY REVIEW REQUESTED != SECURITY EVIDENCE
ZERO FINDINGS != ZERO RISK
```

The gate exists to answer one question:

> **For the frozen external surface and current deployment candidate, is there enough evidence to expose it without silently accepting an uncontrolled security, privacy, or cost failure mode?**

## Trigger conditions

Run the Security Release Gate when any of the following becomes materially true:

- a service, API, webhook, admin surface, upload path, or application becomes reachable by an external or untrusted actor;
- authentication, authorization, tenancy, account ownership, entitlements, or protected records are introduced;
- secrets, API keys, credentials, signing keys, tokens, database credentials, or privileged service identities are used;
- user-controlled data reaches a database query, template, shell/process boundary, URL fetcher, file path, parser, renderer, browser sink, or other interpretable execution boundary;
- an LLM/agent receives untrusted content, retrieval context, tool output, files, web content, or user prompts while also having access to secrets, protected data, privileged tools, or side effects;
- external calls can create material spend, resource consumption, queue growth, storage growth, rate exhaustion, or denial-of-service risk;
- users or operators would need security-relevant logs to reconstruct a compromise, abuse event, entitlement change, or protected-data access;
- a dependency, runtime, base image, action, model/provider integration, or other supply-chain component can become vulnerable or unsupported after release;
- WATCH detects a material new vulnerability, exploit, provider security change, secret exposure, abuse pattern, or threat-model change.

A trigger starts review. It does not imply that every control family below is applicable.

## Applicability and result states

Each control family is classified independently.

Applicability:

```text
REQUIRED / OPTIONAL / NOT_APPLICABLE / BLOCKED
```

Result:

```text
PASS / FAIL / UNKNOWN / UNEXPLORED
```

Hard distinctions:

```text
NOT_RUN != NOT_APPLICABLE
TOOL_RETURNED_ZERO != CONTROL_PROVEN
SCAN_CLEAN != SYSTEM_SAFE
PROMPT_REVIEW != ADVERSARIAL_TEST
```

`NOT_APPLICABLE` requires a reason tied to the frozen surface. `UNKNOWN`, `UNEXPLORED`, or `BLOCKED` on a REQUIRED control cannot silently become release-ready.

## The eight control families

The gate intentionally keeps the useful substance of common pre-release checklists while removing tool-specific or framework-specific assumptions.

### 1. Authorization and isolation

Verify server-side authorization separately from authentication.

Evidence should cover the applicable object, tenant, role, entitlement, admin, and mutation boundaries. Tests should attempt horizontal and vertical privilege violations, identifier/URL/API tampering, and direct calls that bypass the normal UI.

```text
AUTHENTICATED != AUTHORIZED
CLIENT-HIDDEN != SERVER-DENIED
```

For multi-user or multi-tenant systems, a second account/tenant should be used where practical to prove that ownership and isolation are enforced rather than assumed.

### 2. Secret and credential boundary

Verify that secrets are not shipped to untrusted clients, committed as source constants, emitted into public artifacts, or exposed through logs/errors/build output.

Prefer a server-side secret store or deployment/runtime secret mechanism over source embedding. The exact provider is replaceable.

If a material secret was ever exposed, removal from the current file is not remediation by itself. Revoke/rotate the credential and preserve the historical exposure fact when it matters.

```text
DELETED SECRET != ROTATED SECRET
SERVER-SIDE != SAFE_IF_LOGGED_OR_LEAKED
```

### 3. Dependency and supply-chain fitness

Inspect direct and transitive dependencies, runtimes, base images, actions, packages, SDKs, and material hosted components for known vulnerabilities, unsupported/EOL status, provenance/integrity concerns, and unsafe update assumptions.

Use the ecosystem's current supported scanners/advisory sources when available, but do not canonize one command or vendor.

A clean package audit is evidence only for the scope that tool actually covered.

```text
NPM_AUDIT_ZERO != APPLICATION_SECURITY_PASS
DEPENDABOT_ON != PATCH_APPLIED
LATEST != COMPATIBLE_OR_SAFE
```

### 4. Untrusted input, injection, and unsafe output handling

Treat all attacker-controlled input as data crossing a trust boundary, including form fields, headers, cookies, request bodies, uploaded files, path segments, URL/query parameters, webhook payloads, imported documents, and model outputs used downstream.

Use context-appropriate controls such as parameterization, allowlisting, encoding/escaping, parser limits, safe file/path handling, SSRF boundaries, command avoidance, and output validation.

Do not ask an AI to invent a handful of payloads and call the surface tested. Prefer systematic coverage tied to the actual sinks and interpreters in the implementation.

### 5. AI / prompt-injection / agency boundary

When an LLM or agent can be influenced by untrusted content, assume prompt injection is possible and bound the consequences rather than relying on a perfect prompt.

Applicable evidence should examine:

- minimum data/context exposure;
- separation of untrusted content from authority-bearing instructions where the architecture permits it;
- least-privilege tool/data access;
- explicit authorization before destructive, financial, publishing, account, or protected-data side effects;
- validation of model outputs before they reach interpreters or privileged tools;
- resistance to direct and indirect prompt injection appropriate to the actual data sources;
- secret and cross-user data exposure paths;
- bounded recursion/tool loops/resource consumption.

```text
SYSTEM_PROMPT != SECURITY_BOUNDARY
MODEL_REFUSAL != AUTHORIZATION
PROMPT_INJECTION_MITIGATION != PERFECT_PREVENTION
```

If the model does not need a datum, tool, credential, or side effect to satisfy the frozen workload, remove that capability before trying to prompt-engineer around it.

### 6. Abuse, rate, cost, and resource bounds

Externally triggerable paid or scarce operations require bounded consumption appropriate to the threat model.

Consider per-principal and global rate limits, concurrency/queue bounds, request/body/token/file limits, quotas, spend/budget alerts, circuit breakers, kill switches, cache/reuse, and provider-side limits where available.

The control must protect both wallet and availability.

```text
RATE_LIMIT != COMPLETE_COST_BOUND
PROVIDER_BUDGET_ALERT != HARD_KILL_SWITCH
NO_MALICIOUS_USER != NO_BOT
```

### 7. Security-relevant logging and incident reconstruction

Record enough security-relevant events to reconstruct material access and abuse without turning logs into a second secret/PII database.

Applicable events may include authentication outcomes, authorization failures, privilege/entitlement changes, protected-record access, admin actions, abuse/rate-limit events, security configuration changes, and incident-response actions.

Logs should avoid plaintext secrets, passwords, raw API keys, unnecessary protected payloads, and other data not required for the reconstruction contract.

```text
NO_LOG != NO_INCIDENT
MORE_LOGGING != MORE_SECURITY
```

Retention, access control, integrity, privacy, and cost of logs remain part of the workload.

### 8. Vulnerability freshness and response path

Release-day evidence expires.

Establish a bounded path for new vulnerability/security signals to reach WATCH and a named response path to triage, patch, mitigate, roll back, revoke, disable, or explicitly accept risk.

Possible signal providers include repository-native dependency alerts/security updates, package advisories, runtime/base-image advisories, provider notices, secret scanning, security mailing lists, or other current sources. They are replaceable supply paths, not method dependencies.

```text
SAFE_ON_RELEASE_DAY != SAFE_FOREVER
ALERT_RECEIVED != REMEDIATED
NO_ALERT != NO_VULNERABILITY
```

## Minimum security evidence packet

For a material external release, record at least:

```text
subject
candidate_identity: commit / revision / artifact / image / equivalent
external_surface
trust_boundaries
protected_assets
applicable_control_families
per_control_applicability
per_control_evidence
per_control_result
known_findings
known_unknowns
accepted_residual_risk
required_mitigations
rollback / disable / revoke path
watch_signal_sources
response_owner_or_authority
reviewed_at
```

Secrets and protected customer data must not be copied into the packet.

Evidence must bind to the candidate actually being released. A security result against an older SHA, image, configuration, route, prompt/tool set, or deployment identity cannot silently certify a changed candidate.

```text
OLD_SECURITY_PASS != CURRENT_CANDIDATE_PASS
```

## Release outcomes

The gate produces one of:

```text
SECURITY_RELEASE_READY
SECURITY_RELEASE_BLOCKED
EXPLICIT_RISK_ACCEPTANCE_REQUIRED
```

`SECURITY_RELEASE_READY` requires all REQUIRED control families to have sufficient current evidence and no unresolved finding that violates a frozen release invariant.

`SECURITY_RELEASE_BLOCKED` means the candidate must not be represented as ready for the frozen external surface.

`EXPLICIT_RISK_ACCEPTANCE_REQUIRED` is a Human Gate. It must name the specific residual risk, affected surface/assets, evidence gap, mitigation, rollback/disable path, and review/expiry trigger. AI/subagents cannot accept the risk on the human's behalf.

## Fail-closed conditions

For a control classified REQUIRED, fail closed when material evidence shows or cannot rule out a release-invariant violation such as:

- one user/tenant can read or mutate another's protected data without authority;
- a privileged secret is shipped to an untrusted client or is known exposed and still valid;
- attacker-controlled input reaches a material interpreter or privileged sink without the required boundary;
- an AI/agent can use attacker-controlled content to reach destructive/financial/protected side effects outside the frozen authority model;
- externally triggerable paid/scarce operations have no material consumption bound where abuse could create unacceptable loss or outage;
- a known exploitable/unsupported dependency or platform risk violates the frozen release criteria;
- required security evidence is bound to the wrong candidate identity;
- a required control remains `UNKNOWN`, `UNEXPLORED`, or `BLOCKED` with no explicit Human risk acceptance.

Not every finding is automatically a blocker. Severity is determined by the frozen surface, exploitability, reachable assets, compensating controls, and recovery obligations — not by a scanner's count alone.

## Independent adversarial review

Material security completion claims should receive materially separated review when the frozen risk justifies it.

The existing DA / Counter-DA / Reality Verifier topology may be used rather than creating a permanent security-agent bureaucracy. A security-focused DA can attack trust boundaries and abuse cases; a verifier can independently check the evidence and candidate identity.

When an independent evaluator cannot be established, record that limitation. Do not silently relabel the implementer's self-review as independent assurance.

```text
IMPLEMENTER_SELF_REVIEW != INDEPENDENT_SECURITY_REVIEW
SEPARATE_MODEL != AUTOMATIC_INDEPENDENCE
```

Independence still requires the normal technical non-mutation/evidence boundary when a specialist verdict is used as material promotion evidence.

## Relationship to Exposure Gate and Reality Gate

The gates answer different questions:

- **Exposure Gate** — what should be PUBLIC / SPLIT / PRIVATE?
- **Security Release Gate** — is the chosen externally reachable surface evidenced well enough to expose?
- **Post-deploy Reality Gate** — did the deployed candidate actually behave correctly in the verified runtime identity?

A private repository can still deploy an insecure public service. A public repository can still implement a secure service. Repository visibility is not a substitute for runtime security.

```text
PRIVATE_REPO != SECURE_SERVICE
PUBLIC_SOURCE != INSECURE_SERVICE
SECURITY_RELEASE_GATE != EXPOSURE_GATE
SECURITY_RELEASE_GATE != REALITY_GATE
SECURITY_RELEASE_GATE != FOURTH_DESTRUCTION
```

## WATCH integration

WATCH should reopen this gate when materially relevant reality changes, including:

- a new CVE/advisory/exploit affecting a reachable component;
- dependency/runtime/provider EOL or deprecation;
- secret exposure or credential compromise;
- new abuse or bot behavior;
- a new external route, tool, integration, upload source, data source, tenant, role, or privilege;
- material model/agent capability or tool-permission changes;
- security-control configuration drift;
- material cost/pricing/limit changes;
- incident evidence that invalidates a previous assumption.

If the new evidence challenges the implementation's whole-life fitness or incumbency, it may also trigger METEOR/DARWIN. If it only changes the release risk boundary, reopening this gate may be sufficient.

## DA / Counter-DA

### DA — reasons not to add a permanent security checklist

1. A fixed eight-item list can create false completeness while missing SSRF, CSRF, cryptography, session management, business-logic abuse, file-upload risks, infrastructure drift, or future classes.
2. Tool-specific rules such as "npm audit must be zero" or "Dependabot enabled" can be wrong for non-Node ecosystems and can confuse alerting with remediation.
3. Security can become paperwork detached from the candidate actually deployed.
4. Mandatory heavyweight penetration testing for every local/offline artifact would violate the bounded-work principle.
5. Adding a permanent security specialist agent would duplicate existing DA/verifier roles unless specialization proves necessary.
6. No pre-release gate can guarantee that a future vulnerability will not appear.

### Counter-DA — surviving minimal responsibility

The responsibility survives as a **material-triggered, evidence-bound, cross-cutting release gate**:

- eight control families are prompts for coverage, not a claim of exhaustive security taxonomy;
- every family has explicit applicability and evidence state;
- tool/vendor names remain replaceable;
- required unknowns fail closed or require explicit Human risk acceptance;
- results bind to the exact release candidate/deployment configuration;
- existing DA/verifier roles are reused before adding new permanent agents;
- WATCH supplies continuing vulnerability/security triggers after release;
- the gate does not replace post-deploy Reality evidence or incident recovery.

### Verdict

`PASS / MINIMAL CROSS-CUTTING INTEGRATION AUTHORIZED`

## Current standards context at adoption

The control families are consistent with the current security problem classes represented by OWASP's web-application Top 10 and OWASP's GenAI/LLM risk work, including broken access control, injection, vulnerable/outdated components, security logging/monitoring failures, prompt injection, excessive agency/sensitive information exposure, supply-chain risk, and unbounded consumption.

GitHub Dependabot is one possible dependency-vulnerability signal and update mechanism where GitHub and a supported ecosystem are in use. It is deliberately not a mandatory Ultimate Loop dependency.

## Hard invariants

```text
WORKS != SAFE_TO_EXPOSE
AUTHENTICATED != AUTHORIZED
DELETED SECRET != ROTATED SECRET
SYSTEM_PROMPT != SECURITY_BOUNDARY
TOOL_RETURNED_ZERO != CONTROL_PROVEN
OLD_SECURITY_PASS != CURRENT_CANDIDATE_PASS
ALERT_RECEIVED != REMEDIATED
IMPLEMENTER_SELF_REVIEW != INDEPENDENT_SECURITY_REVIEW
PRIVATE_REPO != SECURE_SERVICE
SECURITY_RELEASE_GATE != FOURTH_DESTRUCTION
```
