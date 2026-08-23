# Codex-native Ultimate Loop Runtime — DA / Counter-DA

Date: 2026-08-23
Status: `PROVISIONAL / IMPLEMENTED ON BRANCH / RUNTIME_EVIDENCE_PENDING`

## Frozen subject

Adapt the useful mechanism behind the common “AI employee” pattern to Codex without importing a fixed org chart, duplicating project knowledge, weakening Ultimate Loop authority boundaries, or creating permanent scaffolding that the method itself would reject.

## Current evidence

Current Codex behavior supports persistent project instructions through `AGENTS.md`, reusable project skills, and custom subagents. The exact provider surfaces remain replaceable and are not promoted into Ultimate Loop invariants.

## Candidate A — seven permanent AI employees

Rejected.

Reason: fixed role count is workload-independent. It creates idle role definitions, routing burden, context duplication, and a new quasi-organization that must itself be maintained. It conflicts with Ultimate Loop's anti-scaffold rule and Raison d'être Destroy.

## Candidate B — one monolithic instruction file

Rejected as insufficient.

Reason: it gives persistent context but cannot preserve useful independence between implementation and adversarial/reality review. A single actor can too easily mutate the candidate and then validate its own mutation.

## Candidate C — parent orchestrator + 3 read-only specialists + on-demand skill

Survivor for v0.

Shape:

```text
AGENTS.md
  -> persistent repository contract / routing

.agents/skills/ultimate-loop/SKILL.md
  -> on-demand /goal procedure

parent Codex session
  -> orchestration + implementation

.codex/agents/devils-advocate.toml
  -> necessity/design attack, read-only

.codex/agents/counter-advocate.toml
  -> attacks DA findings, read-only

.codex/agents/reality-verifier.toml
  -> independent evidence verification, read-only
```

No role has promotion authority. TRACE remains observer-only. Human Gates remain human unless explicit authority is already present.

## Devil's Advocate findings

### DA-1 — Permanent subagents can become ceremony

Risk: the method starts spawning three agents for every trivial edit.

Mitigation: `AGENTS.md` and the skill explicitly require specialists only when independence earns its cost; simpler direct checks win for trivial work.

Result: survives.

### DA-2 — Verifier contamination

Risk: a verifier that can edit can silently fix the candidate and then report PASS, destroying independence and evidence order.

Mitigation: all three specialists use read-only sandbox defaults and instructions explicitly prohibit repair.

Result: survives, subject to actual Codex runtime honoring the configured sandbox.

### DA-3 — Knowledge duplication

Risk: copying business/project knowledge into this repository creates drift against external canonical decision stores.

Mitigation: `AGENTS.md` contains routing and authority rules only. Workload-specific knowledge remains in its declared canonical source.

Result: survives.

### DA-4 — Provider lock-in

Risk: `AGENTS.md`, project skills, and custom-agent TOML are Codex-specific surfaces.

Mitigation: they are an execution adapter, not canonical method semantics. `METHOD.md` remains provider-independent and the adapter is replaceable under Raison d'être / METEOR / DARWIN.

Result: survives.

### DA-5 — False `/goal` native-command claim

Risk: repository convention could be mistaken for a Codex-native slash command.

Mitigation: `AGENTS.md` explicitly defines `/goal` as a repository convention that routes to the project skill when available.

Result: survives.

## Counter-DA

The strongest counter-case is that even three specialists may be unnecessary because a frontier parent model can self-critique.

That objection is partly valid. The survivor therefore does not require specialist spawning on every run. Independence is justified only for material architecture/promotion/evidence claims where actor separation materially reduces correlated failure. For small tasks, the parent may run the same checks directly.

The smallest invariant retained is:

`MATERIAL SELF-APPROVAL RISK -> INDEPENDENT READ-ONLY CHECK WHEN PRACTICABLE`

not:

`EVERY TASK -> THREE SUBAGENTS`.

## Promotion boundary

This branch proves repository implementation, not runtime fitness.

Still required before calling the adapter `RUNTIME_VALIDATED`:

1. open the branch in a current Codex environment;
2. confirm `AGENTS.md` is loaded;
3. confirm the `ultimate-loop` skill is discovered and can be invoked/routed from a `/goal` prompt;
4. confirm all three custom agents are discovered;
5. confirm their configured read-only behavior actually prevents mutation;
6. execute one bounded dogfood task and verify parent -> DA -> Counter-DA -> implementation -> Reality Verifier flow;
7. record observed failures and modify the adapter only if the failures are material.

Until then:

`REPOSITORY_IMPLEMENTED != CODEX_RUNTIME_VALIDATED`.

## Decision

Adopt Candidate C as the smallest Codex-native v0 challenger and open it for runtime dogfood. Do not merge solely because the files parse or exist.