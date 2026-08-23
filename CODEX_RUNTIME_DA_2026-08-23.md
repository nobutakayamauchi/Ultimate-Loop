# Codex-native Ultimate Loop Runtime — DA / Counter-DA / Dogfood

Date: 2026-08-23
Status: `PROVISIONAL / IMPLEMENTED ON BRANCH / DOGFOOD_PASS_1 / CODEX_RUNTIME_EXECUTION_PENDING`

## Frozen subject

Adapt the useful mechanism behind the common “AI employee” pattern to Codex without importing a fixed org chart, duplicating project knowledge, weakening Ultimate Loop authority boundaries, or creating permanent scaffolding that the method itself would reject.

The first dogfood subject is this adapter itself: PR #6 / branch `codex/ultimate-loop-runtime-v0`.

## Current evidence refreshed on 2026-08-23

Current official Codex documentation supports the following surfaces used by this adapter:

- repository instructions through root/nested `AGENTS.md`;
- repository skills under `.agents/skills/<skill>/SKILL.md`;
- project custom agents under `.codex/agents/*.toml`;
- required custom-agent fields `name`, `description`, and `developer_instructions`;
- custom-agent `sandbox_mode = "read-only"` as a supported configuration;
- subagent delegation requested by applicable `AGENTS.md` or skill instructions.

Two material runtime caveats were also confirmed:

1. live parent permission/sandbox overrides may be reapplied to spawned agents, so a custom-agent `sandbox_mode = "read-only"` declaration is not by itself proof that the live child could not write;
2. Codex may protect `.agents/` and `.codex/` recursively as read-only paths inside an otherwise writable workspace.

The exact provider surfaces remain replaceable and are not promoted into Ultimate Loop invariants.

## Candidate A — seven permanent AI employees

Rejected.

Reason: fixed role count is workload-independent. It creates idle role definitions, routing burden, context duplication, and a new quasi-organization that must itself be maintained. It conflicts with Ultimate Loop's anti-scaffold rule and Raison d'être Destroy.

## Candidate B — one monolithic instruction file

Rejected as insufficient.

Reason: it gives persistent context but cannot preserve useful independence between implementation and adversarial/reality review. A single actor can too easily mutate the candidate and then validate its own mutation.

## Candidate C — parent orchestrator + 3 narrow specialists + on-demand skill

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
  -> necessity/design attack

.codex/agents/counter-advocate.toml
  -> attacks DA findings

.codex/agents/reality-verifier.toml
  -> independent evidence verification
```

All three custom agents request a read-only sandbox and also carry prompt-level non-mutation instructions. Neither layer alone is treated as proof of live technical immutability.

No role has promotion authority. TRACE remains observer-only. Human Gates remain human unless explicit authority is already present.

## Devil's Advocate findings

### DA-1 — Permanent subagents can become ceremony

Risk: the method starts spawning three agents for every trivial edit.

Mitigation: `AGENTS.md` and the skill explicitly require specialists only when independence earns its cost; simpler direct checks win for trivial work.

Result: survives.

### DA-2 — Verifier contamination

Risk: a verifier that can edit can silently fix the candidate and then report PASS, destroying independence and evidence order.

Initial mitigation was insufficient: the branch originally relied too strongly on `sandbox_mode = "read-only"` plus prompt instructions.

Dogfood finding: current Codex documentation states that live parent permission/sandbox overrides may be inherited/reapplied by a spawned agent. Therefore:

`READ_ONLY REQUESTED != READ_ONLY PROVEN`

Revised mitigation:

- finish parent writes before specialist verification;
- capture pre-specialist repository/worktree state;
- prohibit concurrent parent/sibling writes during the verification window;
- use the narrowest available live permission, preferably an explicit read-only run/session when practical;
- capture post-specialist state;
- invalidate the verdict if state mutated or the independence boundary cannot be established.

Result: survives after patch; runtime observation still required.

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

### DA-6 — Self-modification can collide with protected Codex paths

Risk: the adapter asks Ultimate Loop to improve itself, but current Codex sandboxing may protect `.agents/` and `.codex/` recursively even when the workspace is otherwise writable. A naive implementation might respond by escalating to unrestricted permissions.

Mitigation: classify this as a self-modification permission boundary, not as a reason to bypass sandboxing. Use only explicit approval or an already-authorized external write mechanism. After changing runtime configuration, verify loading in a fresh context when necessary.

Invariant:

`SELF-MODIFICATION DESIRED != SELF-MODIFICATION AUTHORIZED`

Result: survives; safety boundary retained.

### DA-7 — ChatGPT/hosted subagents are not equivalent to local Codex custom agents

Risk: a hosted ChatGPT subagent run is accepted as evidence that `.codex/agents/*.toml` loaded in an actual Codex desktop/CLI/IDE runtime.

Mitigation: runtime promotion evidence must come from a current Codex environment that supports project-scoped custom agents. Hosted reasoning may find design defects, but it cannot substitute for the remaining local/runtime discovery checks.

Result: survives with explicit evidence boundary.

## Counter-DA

The strongest counter-case is that even three specialists may be unnecessary because a frontier parent model can self-critique.

That objection is partly valid. The survivor therefore does not require specialist spawning on every run. Independence is justified only for material architecture/promotion/evidence claims where actor separation materially reduces correlated failure. For small tasks, the parent may run the same checks directly.

A second counter-case is that before/after repository-state checks add ceremony. This is also partly valid: they are required only where a specialist verdict materially depends on non-mutation independence. For trivial read-only advice, the overhead is unnecessary.

The smallest invariant retained is:

`MATERIAL SELF-APPROVAL RISK -> INDEPENDENT CHECK WITH OBSERVABLE NON-MUTATION EVIDENCE WHEN PRACTICABLE`

not:

`EVERY TASK -> THREE SUBAGENTS`.

## Dogfood pass 1 — result

This branch was reviewed against current official Codex behavior before merge.

Observed result:

- `AGENTS.md` placement/role: compatible with current Codex documentation;
- `.agents/skills/ultimate-loop/SKILL.md`: compatible with documented repository-skill location and metadata shape;
- `.codex/agents/*.toml`: compatible with documented project custom-agent location and required fields;
- configured read-only specialist assumption: **finding opened and fixed** because live parent permission overrides can weaken the technical guarantee;
- self-modification path: **finding opened and bounded** because `.agents/` and `.codex/` may be protected paths;
- actual Codex custom-agent discovery/spawn and end-to-end local execution: **NOT RUN in this evidence context**.

Changes made from dogfood pass 1:

1. added `READ_ONLY REQUESTED != READ_ONLY PROVEN` invariant;
2. added before/after state contamination checks for material specialist verdicts;
3. added explicit self-modification permission boundary;
4. hardened all three specialist prompts not to edit even if write capability is inherited;
5. kept PR #6 Draft because repository/spec compatibility is not runtime validation.

## Promotion boundary

Still required before calling the adapter `RUNTIME_VALIDATED`:

1. open this branch in a current Codex desktop/CLI/IDE environment;
2. confirm `AGENTS.md` is loaded;
3. confirm the `ultimate-loop` skill is discovered and can be invoked/routed from a `/goal` prompt;
4. confirm all three custom agents are discovered by name;
5. record the effective permission mode used for each material specialist run;
6. prove non-mutation with pre/post state around a specialist verification window, rather than trusting config text alone;
7. execute one bounded end-to-end dogfood task through parent -> DA -> Counter-DA -> implementation -> Reality Verifier;
8. preserve any failure/UNKNOWN and patch only material problems.

A CI-based Codex run is also possible, but the official Codex GitHub Action requires an OpenAI API key stored as a GitHub secret. Do not add a permanent CI harness merely to perform a one-off proof unless repeated CI verification becomes a real requirement.

Until the runtime evidence above exists:

`REPOSITORY_IMPLEMENTED != CODEX_RUNTIME_VALIDATED`.

## Decision

Keep Candidate C as the smallest surviving Codex-native v0 challenger. Dogfood pass 1 improved the adapter and exposed a real independence flaw. Do not merge PR #6 yet; the remaining blocker is actual Codex runtime evidence, not another repository design task.