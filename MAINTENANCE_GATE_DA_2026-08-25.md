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

## Counter-Advocate

The DA destroys several proposed implementations, but not the responsibility itself.

A smaller survivor exists:

1. reuse WATCH as the detection owner rather than adding a fourth loop;
2. use deterministic/current repository and external-feed evidence first;
3. notify via a replaceable repository record (GitHub Issue in V1);
4. require explicit authorization bound to `MAINTENANCE_ID + exact candidate SHA + model/runtime + budget + attempt count + expiry`;
5. keep paid provider secrets outside WATCH;
6. permit one paid attempt by default;
7. use existing DA, Counter-DA, and Reality Verifier roles rather than creating a maintenance-agent organization;
8. stop on FAIL/BLOCKED/budget exhaustion and require a new human decision for a new candidate;
9. bind PASS to exact candidate identity;
10. treat OpenAI/GitHub as the current implementation profile, not method dependencies.

This satisfies the frozen responsibility with less permanent machinery than a dedicated maintenance subsystem.

## Survivor

`WATCH SELF-MAINTENANCE PROFILE + HUMAN/SPEND GATE + EXISTING ULTIMATE LOOP ROLES`

Not:

`FOURTH LOOP + PERMANENT PAID WATCHER + AUTO-REPAIR/AUTO-RETRY`

## Remaining Reality boundary

The design survives this parent-level DA/Counter-DA record, but promotion still requires runtime evidence that the updated `/goal` skill and role sequence actually load and obey the technical boundaries.

Until that evidence exists:

`DESIGN_SURVIVED != RUNTIME_VERIFIED != PROMOTION_READY`.