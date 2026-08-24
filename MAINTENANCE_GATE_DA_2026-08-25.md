# Maintenance Gate — DA / Counter-DA Record (2026-08-25)

Status: `DESIGN EVIDENCE / NOT RUNTIME VERIFICATION`

This record captures the design attack and counter-case used before wiring the Maintenance Gate into Ultimate Loop. It is not evidence that the Codex custom `devils-advocate`, `counter-advocate`, or `reality-verifier` roles executed. Runtime promotion evidence remains separate.

## Frozen responsibility

When Ultimate Loop itself materially changes or becomes stale, detect that fact cheaply, notify the human, and permit bounded paid maintenance only after explicit human authorization. Prevent paid self-maintenance, retries, or self-promotion from becoming automatic.

## Devil's Advocate findings

### DA-1 — A dedicated maintenance loop would violate the architecture

A permanent fourth loop would duplicate WATCH/self-evolution and create the exact scaffold creep the method rejects.

**Disposition:** ACCEPT.

### DA-2 — Payment cannot safely be the authorization event

Existing credit may predate the event; payment may be for another workload; billing state may lag; auto-recharge may fire independently. A payment-triggered self-modification path has poor blast-radius control.

**Disposition:** ACCEPT.

### DA-3 — A model-based permanent watcher would consume money to decide whether money should be consumed

This creates circular cost authority and encourages standing bureaucracy.

**Disposition:** ACCEPT.

### DA-4 — GitHub notification is not proof of email delivery or human reading

Using notification delivery as authorization would be false evidence.

**Disposition:** ACCEPT.

### DA-5 — `max_budget_usd: 5` inside a workflow is not a technical USD 5 cap

Codex Action currently exposes model/effort/permissions but a workflow label is not proof that provider billing cannot exceed the amount. Budget control must be backed by provider/project hard limits or an equivalent technical enforcement boundary.

**Disposition:** ACCEPT.

### DA-6 — A generic repository `OPENAI_API_KEY` would weaken the split

If WATCH and paid maintenance can see the same repository-level secret, the intended technical separation can collapse. The paid path should use a maintenance-specific secret in the narrowest available environment/permission boundary.

**Disposition:** ACCEPT.

### DA-7 — Automatic retry turns a bounded inspection into a budget-eating repair loop

`FAIL -> FIX -> RETRY` can become an unbounded paid self-improvement cycle.

**Disposition:** ACCEPT.

### DA-8 — A weak verifier can rubber-stamp the repairer

Role names or a second model instance do not prove independence. The verifier needs a clean/non-inherited evaluation context where practical and a technical non-mutation boundary.

**Disposition:** ACCEPT.

### DA-9 — Treating every documentation change as paid-maintenance-worthy would create alert fatigue

The trigger must distinguish method/authority/runtime semantics from ordinary prose/discoverability edits.

**Disposition:** ACCEPT.

### DA-10 — A standing provider dependency would violate replaceability

The method must survive changes to OpenAI, Codex, GitHub, billing APIs, model names, or notification transport.

**Disposition:** ACCEPT.

### DA-11 — Candidate-side WATCH can self-attest

The first WATCH prototype ran on `pull_request`, which means a candidate that edits the WATCH workflow can execute its own edited detector and then cite that success. That is structurally weak for a leash on AI self-maintenance.

**Disposition:** ACCEPT. Canonical V1 pull-request WATCH moves to trusted-base `pull_request_target`, reads candidate file metadata through the GitHub API, and does not checkout or execute candidate content.

### DA-12 — First-install `workflow_dispatch` has a bootstrap paradox

GitHub only delivers manual `workflow_dispatch` when the workflow file exists on the default branch. A new manual paid-maintenance workflow therefore cannot prove its own normal pre-merge dispatch path on the first installation.

Pretending otherwise would create fake Runtime evidence.

**Disposition:** ACCEPT. Introduce an explicit dormant-bootstrap state: design/static/independent review first, human-authorized install to default branch without claiming PASS, trusted main WATCH creates the exact packet, then default-branch paid dispatch performs the real Runtime/Reality verification. Until that PASS, the gate is installed but not ACTIVE.

### DA-13 — Authorization expiry that is only displayed is decorative

The initial workflow recorded an expiry in the maintenance packet but did not enforce it before paid execution.

**Disposition:** ACCEPT. Paid preflight now parses the exact Issue expiry, requires a timezone-aware future timestamp, and blocks expired packets.

### DA-14 — Arbitrary commit pairs weaken exact-candidate binding

Checking only that `base_sha` and `candidate_sha` are valid commits permits unrelated commit pairs. Likewise, collaborator dispatch rights could silently widen the V1 human authority set.

**Disposition:** ACCEPT. Paid preflight now requires base ancestry of candidate and, in the current V1 profile, requires `github.actor == github.repository_owner`. Multi-human authorization is a future explicit policy change, not an accidental default.

## Counter-Advocate

The DA destroys several proposed implementations, but not the responsibility itself.

A smaller survivor exists:

1. reuse WATCH as the detection owner rather than adding a fourth loop;
2. run PR WATCH from trusted base/default-branch authority and inspect candidate metadata without executing candidate code;
3. use deterministic/current repository and external-feed evidence first;
4. notify via a replaceable repository record (GitHub Issue in V1);
5. require explicit authorization bound to `MAINTENANCE_ID + exact candidate SHA + model/runtime + budget + attempt count + expiry`;
6. enforce authorization expiry and candidate lineage before paid execution;
7. keep paid provider secrets outside WATCH;
8. permit one paid attempt by default;
9. use existing DA, Counter-DA, and Reality Verifier roles rather than creating a maintenance-agent organization;
10. stop on FAIL/BLOCKED/budget exhaustion and require a new human decision for a new candidate;
11. bind PASS to exact candidate identity;
12. treat OpenAI/GitHub as the current implementation profile, not method dependencies;
13. make the first-install bootstrap limitation explicit rather than smuggling it into a false pre-merge PASS.

This satisfies the frozen responsibility with less permanent machinery than a dedicated maintenance subsystem.

## Survivor

`TRUSTED WATCH SELF-MAINTENANCE PROFILE + HUMAN/SPEND GATE + EXISTING ULTIMATE LOOP ROLES`

Not:

`FOURTH LOOP + CANDIDATE SELF-ATTESTATION + PERMANENT PAID WATCHER + AUTO-REPAIR/AUTO-RETRY`

## Remaining Reality boundary

The design survives this parent-level DA/Counter-DA record, but promotion still requires runtime evidence that the updated `/goal` skill and role sequence actually load and obey the technical boundaries.

For the first installation, GitHub's default-branch manual-dispatch constraint creates an explicit bootstrap Human Gate. A dormant install is not a Runtime PASS.

Until the post-install exact-candidate paid Runtime and independent verifier pass:

`DESIGN_SURVIVED != BOOTSTRAP_INSTALLED != RUNTIME_VERIFIED != ACTIVE`.