# /goal — Ultimate Loop Reconstruction Furnace

Status: `FROZEN / RUN AUTHORIZED / BLIND LOAD TEST`

Run family: `RECONSTRUCTION_FURNACE`

Primary source: `microsoft/SWE-bench-Live` + public `SWE-bench-Live/MultiLang` task dataset.

## Purpose

Stress Ultimate Loop as a reconstruction engine rather than as a feature checklist.

Each task must force the method to ingest an unfamiliar real repository, a real issue/problem statement, existing code, build/runtime constraints, and executable tests; reconstruct enough of the world to form an actionable model; attack that model; patch; re-test; reopen when evidence contradicts the model; and converge or stop for an explicit non-convergence reason.

The experiment asks whether repeated exposure to heterogeneous real software improves **unknown-repository reconstruction speed and quality**, not whether Ultimate Loop memorizes known patches.

## Phase 1 — Batch A

- 10 blind tasks.
- Dataset: `SWE-bench-Live/MultiLang`.
- Prefer distinct repositories.
- Cover the available language splits before taking second tasks from a language where possible: C, C++, Go, Rust, Java, TypeScript, JavaScript, C#.
- First uncontaminated anchor task: `rsyslog__rsyslog-6047` if present in the current dataset revision.
- Selection is deterministic from a frozen sampler seed.
- `cilium__tetragon-4069` is quarantined from blind scoring because a gold-patch fragment was already exposed during candidate research.

No canonical Ultimate Loop method change is promoted during Batch A. Reusable observations may be recorded as candidates, but method evolution is evaluated only after the 10-task batch. This keeps the batch interpretable.

## Blind boundary

The solving agent may receive only material needed to solve the problem without the historical answer, such as:

- `instance_id`;
- repository identity;
- issue numbers / issue text / problem statement;
- `base_commit`;
- sanctioned container/sandbox identity;
- build/rebuild/test commands needed to operate the environment.

The solving agent MUST NOT receive or intentionally retrieve:

- `patch` / gold patch;
- `test_patch`;
- solution PR diff or solution commit diff;
- `pull_number` when it identifies the historical solution PR;
- `commit_url` / `commit_urls` pointing to the historical fix;
- solution-bearing hints;
- prior benchmark outputs containing the answer.

If any prohibited answer-bearing material is exposed, mark the task `CONTAMINATED`, preserve the contamination event, exclude it from blind performance claims, and replace it.

`ANSWER EXPOSURE != SOLVED`

## Oracle separation

The official evaluator is an oracle, not an information source for the solver.

Before scoring a task, the evaluation lane SHOULD validate that the official gold patch succeeds repeatedly in the current environment when practical. The upstream benchmark recommends repeated gold evaluation because tests may degrade or vary by machine over time.

The solver may see only oracle outcomes needed for iteration (for example test pass/fail and permitted logs), never the hidden gold patch or hidden test patch.

`ORACLE ACCESS != GOLD ACCESS`

## Reconstruction loop per task

```text
TASK_SELECTED
→ BLIND_INPUT_FROZEN
→ REPOSITORY / ENVIRONMENT IDENTITY
→ DISCOVERY
→ FIRST ACTIONABLE WORLD MODEL
→ DA / COUNTER-DA
→ PATCH CANDIDATE
→ TEST / EVIDENCE
→ FINDING
→ REPLAY / ROOT-CAUSE CLASSIFICATION
→ REOPEN if evidence creates a materially new perspective
→ FIX / REGRESSION
→ TASK_RESOLVED or EXPLICIT_STOP_REASON
```

Generated Attack, Replay Packet, Bounded Destruction, External Nemesis, and Formalization Escalation are available only through the applicability rules already present in the canonical Ultimate Loop method.

## In-run problem handling rule

This rule is experiment-local during Batch A. It may repair the test harness so the already-frozen experiment can be executed honestly, but it may not silently evolve the canonical Ultimate Loop method or make the benchmark easier.

When a new execution, harness, evidence, environment, or test-design problem appears:

```text
PROBLEM
→ DA
→ COUNTER-DA
→ ESSENTIALITY REDUCTION
→ SELF_RESOLVABLE | HUMAN_REQUIRED | AMBIGUOUS
```

### DA / Counter-DA adequacy

Consider materially distinct conditions until another pass produces no materially new perspective. Do not equate token/time/budget exhaustion with adequacy or convergence.

At minimum challenge:

- blind integrity / future-answer exposure;
- frozen task, base revision, oracle and scoring identity;
- comparability with the rest of Batch A;
- target/environment/deployment identity where applicable;
- whether the proposed repair restores a frozen assumption or changes the experiment;
- contamination, replayability and evidence honesty;
- authorization/credential/privilege requirements;
- reversibility and side effects.

Essentiality reduction removes only unnecessary machinery. It may not remove independence, evidence, safety, blind integrity, frozen identities, or explicit stop states merely to continue the run.

### SELF_RESOLVABLE

The run may repair the problem and continue without human approval only when all of the following are supported by evidence:

- the root cause and repair are sufficiently clear after DA / Counter-DA;
- the repair restores or enforces an already-frozen experiment condition rather than changing task difficulty, oracle, scoring, sample meaning, or success criteria;
- the repair does not require new authentication, credentials, privilege, or authorization;
- the repair does not require an irreversible action;
- the repair does not create an unbounded or materially larger blast radius;
- blind integrity remains intact for the task being continued;
- the repair can itself be verified before solver scoring resumes.

Record the finding, repair, verification, and resume point. Then return to the test automatically.

### HUMAN_REQUIRED

Stop and return to the user before acting when any of the following is true:

- new authentication, credentials, privilege, consent, or authorization is required;
- an irreversible action is required;
- the proposed repair would alter a frozen goal, task meaning, oracle, scoring rule, success criterion, or materially change Batch A comparability;
- blind integrity cannot be established;
- the problem remains materially unresolved after DA / Counter-DA and essentiality reduction.

### AMBIGUOUS

If the conclusion is genuinely borderline, competing interpretations remain material, or confidence is insufficient to classify the repair as `SELF_RESOLVABLE`, stop and return the decision to the user.

`AMBIGUOUS != SELF_AUTHORIZED`

`AUTHORIZATION_REQUIRED => HUMAN_REQUIRED`

`IRREVERSIBLE => HUMAN_REQUIRED`

`REPAIR_FROZEN_CONTRACT != CHANGE_FROZEN_CONTRACT`

### Contamination is not repairable retroactively

A contaminated task cannot become blind again merely because the leaking mechanism is later fixed. Preserve the contamination event, exclude that task from blind scoring, repair the mechanism if `SELF_RESOLVABLE`, verify the repair, then continue with the deterministic replacement procedure.

`FIXED_LEAK != UNSEEN_INFORMATION`

## Carryover between tasks

Allowed carryover:

- tool-independent reconstruction heuristics;
- failure taxonomies;
- evidence-ordering rules;
- search/navigation strategies;
- reusable invariants;
- benchmark-harness lessons that do not reveal task answers.

Forbidden carryover:

- gold or historical patches;
- task-specific fix fragments;
- direct solution mappings keyed by repository/issue;
- hidden test-patch content;
- answer-bearing retrieval caches.

The goal is transfer of **method**, not transfer of answers.

## TRACE measurement contract

When TRACE-compatible instrumentation is available, record at minimum:

- `RUN_STARTED` / `RUN_STOPPED`;
- task start/stop and task identity;
- language / repository identity;
- discovery span;
- time to first actionable hypothesis;
- loop iteration spans;
- findings opened/resolved;
- reopen causes;
- patch attempts;
- test/evaluation outcomes;
- human decisions/touches;
- external waits;
- bound exhaustion;
- contamination events;
- environment-invalid / oracle-invalid events.

Derived Batch A metrics SHOULD include:

- resolved tasks / valid tasks;
- wall time per valid task;
- time to first actionable hypothesis;
- loop iterations per task;
- findings and distinct root-cause classes per task;
- reopen rate;
- replay success rate where applicable;
- human touches per task;
- compute/token/tool-call cost when observable;
- reconstruction acceleration from early tasks to later unseen tasks;
- observer overhead.

Missing evidence remains `UNKNOWN`, never zero.

## Stop reasons

Valid stop reasons include:

- `TASK_RESOLVED`;
- `BOUND_EXHAUSTED / FRONTIER_OPEN`;
- `CONTAMINATED`;
- `ORACLE_INVALID`;
- `ENVIRONMENT_BLOCKED`;
- `REAL_WORLD_EVIDENCE_REQUIRED`;
- explicit human stop.

`BOUND_EXHAUSTED != CONVERGENCE`

`ENVIRONMENT_BLOCKED != SOLVER_FAILURE`

## Phase transition

After 10 valid blind tasks (replacing contaminated/invalid ones), freeze Batch A results and run Ultimate Loop against its own run history.

Only then may reusable findings be proposed as method evolution.

Any evolution must survive DA / Counter-DA and is tested on a fresh, previously unseen Batch B before being credited as improvement.

`SAME-TASK IMPROVEMENT != GENERALIZATION`
