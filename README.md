# Codex Project Template

A lightweight, reusable repository template for autonomous Codex-first development.

It provides concise agent guidance, bounded delegation, durable project context, task handoffs, and explicit verification without adding a framework.

## Model routing

These are human routing defaults. The checked-in Codex configuration uses **Luna Max** for spawned workers, **Terra High** for repository mapping, and **Astra Low** for independent review; you still choose the primary director model. Each label combines a model with a reasoning effort; for example, **Luna Max** means GPT-5.6 Luna with Max reasoning. Availability can vary by account and client.

Treat the percentages as starting targets, not quotas. Default to **Luna Max** for autonomous implementation after the plan, acceptance criteria, relevant paths, and verification commands are clear. Use **Sol Medium** when implementation remains ambiguous or consequential, and **Terra High** when fast investigation or interactive iteration matters most.

1. **Plan - ~10%: Astra Low**
   Define the architecture, relevant paths, implementation steps, edge cases, and acceptance criteria. Use Astra Medium when the decision is high-risk, irreversible, or cross-cutting.
2. **Implement - ~75% total**
   - **Luna Max - ~55%:** Clear plans, bounded autonomous tasks, repetitive implementation, and parallel workers.
   - **Sol Medium - ~15%:** Ambiguous or consequential implementation that benefits from deeper judgment.
   - **Terra High - ~5%:** Fast repository investigation, interactive work, and quick debugging.
3. **Verify / review - ~8%: implementing worker + Astra Low**
   - The implementing worker must run the tests and fix failures.
   - Use a fresh-context Astra Low pass for independent review.
   - Return valid findings to the responsible worker, then rerun the affected checks.
4. **Hard implementation - ~5%: Astra Medium or Sol High**
   - Use Astra Medium after a serious failed attempt or when stronger end-to-end judgment is needed.
   - Use Sol High for difficult technical debugging or cross-cutting implementation that benefits from deeper analysis.
5. **Extreme / stuck - ~2%: Astra High or Max**
   - repeated failures;
   - high-risk architecture;
   - subtle cross-system bugs;
   - security or data-integrity concerns;
   - final arbitration when agents disagree.

### Daily drivers

About 75% of coding should use three implementation routes:

- **Luna Max - ~55%:** planned autonomous execution.
- **Sol Medium - ~15%:** ambiguous or consequential implementation and codebase reasoning.
- **Terra High - ~5%:** interactive work and fast investigation.

If you remember only four routes:

- **Astra Low:** plan and direct.
- **Luna Max:** build.
- **Sol Medium:** solve difficult implementation ambiguity.
- **Terra High:** map, investigate, and interact.

### Current benchmark comparison

This is a dated routing aid, not a permanent ranking. Results measure a model, reasoning effort, agent harness, and benchmark version together.

| Model route    | AA Coding Agent Index v1.4 | AA API cost / task | DeepSWE v1.1 pass@1 |
| -------------- | -------------------------- | ------------------ | ------------------- |
| **Astra Low**  | 62.6                       | $1.41              | 67.0%               |
| **Luna Max**   | 57.1                       | $0.29              | 67.2%               |
| **Terra High** | 55.0                       | $1.14              | 53.8%               |
| **Sol Medium** | 62.0                       | $2.19              | 61.1%               |

The Artificial Analysis columns use its last complete same-Codex exact-effort comparison for these four routes. Its current v1.5 index changed the suite to DeepSWE v1.1, Terminal-Bench 4.0, and SWE-Atlas-QnA, so scores from the two index versions must not be mixed. DeepSWE v1.1 uses the same mini-swe-agent harness across models. Costs are pay-per-token API estimates, not Codex subscription or quota usage. Sources: [Artificial Analysis Coding Agent Index and methodology](https://artificialanalysis.ai/methodology/coding-agents-benchmarking/) and [DeepSWE v1.1](https://deepswe.datacurve.ai/). Snapshot reviewed 2026-09-12.

Broader model evaluations support Astra Low for planning and review, while reinforcing Luna Max's cost advantage. These figures are not coding-agent results and should not replace the table above.

| Model route    | AA Intelligence Index v4.3 | AutomationBench-AA | Terminal-Bench v4.0 | AA reliability index | AA API cost / task |
| -------------- | -------------------------- | ------------------ | ------------------- | -------------------- | ------------------ |
| **Astra Low**  | **46**                     | **59%**            | **42%**             | **41**               | $0.82              |
| **Luna Max**   | 38                         | 50%                | 12%                 | -10                  | **$0.18**          |
| **Terra High** | 34                         | 42%                | 2%                  | -3                   | $0.34              |
| **Sol Medium** | 39                         | 51%                | 15%                 | 19                   | $0.50              |

Sources: [Astra Low versus Luna Max](https://artificialanalysis.ai/models/comparisons/gpt-6-astra-low-vs-gpt-5-6-luna), [Astra Low versus Terra High](https://artificialanalysis.ai/models/comparisons/gpt-6-astra-low-vs-gpt-5-6-terra-high), and [Astra Low versus Sol Medium](https://artificialanalysis.ai/models/comparisons/gpt-6-astra-low-vs-gpt-5-6-sol-medium).

For autonomous coding, prioritize evidence in this order:

1. Repeated project-specific tasks with real acceptance tests, regression checks, elapsed time, and usage.
2. The current Artificial Analysis Coding Agent Index and its component breakdowns for a broad agent comparison.
3. DeepSWE for long-horizon repository implementation.
4. Terminal-Bench for terminal/tool execution and SWE-Atlas-QnA for repository understanding.

Do not use a broad intelligence index alone to choose coding-agent routes; it does not directly measure reliable repository implementation. Use **Luna Max** for implementation throughput, **Astra Low** for planning and independent review, **Sol Medium** for consequential or ambiguous implementation, and **Terra High** for fast read-heavy investigation. Validate these defaults against repeated project-specific tasks.

## Autonomous director workflow

The primary Codex chat is the director and remains responsible for the final result:

1. You specify the outcome, constraints, and acceptance criteria.
2. The director inspects the repository and prepares or refines the task plan.
3. You approve large or multi-agent plans before implementation unless the plan was already approved.
4. The director delegates bounded work when useful: the read-only Terra `code_mapper` maps code, built-in Luna workers implement and verify, and the read-only Astra `reviewer` inspects the integrated diff. Use a Sol Medium worker override for consequential or ambiguous implementation.
5. Workers fix valid findings and rerun affected checks without routine human checkpoints.
6. The director reports the result and performs Git or GitHub delivery only when explicitly authorized.

The project configuration caps spawned agents at four; start with one to three. Use parallel writers only for disjoint paths. Use separate worktree chats for independent tasks that may overlap.

## Build the workflow in a new project

A repository created from this template is not implementation-ready until the project-specific context and feedback loop are real.

### Bootstrap once

1. Create the new repository from this template and open its root in Codex.
2. Add the project's source files, tests, assets, and dependencies using the layout that suits its stack; do not create empty conventional directories just to match another project.
3. Complete `docs/PRODUCT.md` with the outcome, scope, constraints, and non-goals.
4. Complete `docs/ARCHITECTURE.md` with the actual repository map, system boundaries, data flow, and important invariants.
5. Replace the placeholders in `docs/TESTING.md` with commands Codex can really run. Update `docs/CURRENT_STATE.md` with known limitations or migration state.
6. Review `.codex/config.toml` and the two custom agents for model availability, then trust the project if you want Codex to apply them.
7. After the real verification commands work locally, add project-specific CI that runs the same checks. Protect the default branch if the repository will use pull requests.

### Run each task

1. Copy `docs/tasks/TEMPLATE.md` into `docs/tasks/active/` for substantial work. Define the goal, acceptance criteria, constraints, non-goals, relevant paths, and verification. Add delegation only when workstreams are genuinely independent.
2. Select the primary director model: use Astra Low to plan and direct substantial work, Terra High for small interactive work, and Sol Medium when implementation remains ambiguous or consequential. Use Astra Medium for consequential architecture or other high-risk decisions.
3. Start with this compact prompt, replacing the task path:
   ```text
   Read AGENTS.md and docs/tasks/active/<task>.md.
   Act as the director and complete the task using the repository workflow.
   Delegate only when useful. Continue through verification and independent review.
   Return only when complete or when genuine human judgment is required.
   Do not commit, push, open a PR, or merge unless I explicitly request it.
   ```
4. Review and approve the proposed plan for large, risky, or multi-agent work. Before implementation, create or explicitly ask Codex to create a task-specific branch or isolated worktree.
5. Let the director run the implementation, targeted checks, integrated verification, reviewer pass, and bounded fix loop without routine checkpoints.
6. Review the final diff, verification evidence, and remaining risks. If satisfied, explicitly request the desired delivery steps: commit, push, and open a PR.
7. Merge only after required CI and reviews pass. Mark the task `Completed`, record its verification outcomes, and move it to `docs/tasks/completed/`.



## Repository structure

```text
codex-project-template/
|-- AGENTS.md                         durable agent rules and workflow
|-- README.md                         template purpose and bootstrap
|-- .gitignore                        common local files and secrets
|-- .codex/
|   |-- config.toml                   bounded multi-agent defaults
|   `-- agents/
|       |-- code-mapper.toml          read-only repository explorer
|       `-- reviewer.toml             read-only independent reviewer
|-- .github/
|   `-- PULL_REQUEST_TEMPLATE.md      PR context and verification evidence
`-- docs/
    |-- PRODUCT.md                    product scope and outcomes
    |-- ARCHITECTURE.md               system boundaries and repository map
    |-- TESTING.md                    project verification commands and strategy
    |-- CURRENT_STATE.md              current limitations and temporary facts
    |-- decisions/
    |   `-- TEMPLATE.md               optional architecture decision template
    `-- tasks/
        |-- TEMPLATE.md               task handoff template
        |-- active/
        |   `-- .gitkeep              keeps the active task directory in Git
        `-- completed/
            `-- .gitkeep              keeps the completed task directory in Git
```

Keep `AGENTS.md` concise and put durable project detail in `docs/`. Add nested agent instructions only when a subtree genuinely needs different rules.
