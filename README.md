# Codex Project Template

A lightweight, reusable repository template for Codex-first development.

It provides concise agent guidance, durable project context, task handoffs, and explicit verification without adding a framework.

## Model routing

These are human routing defaults, not automatic Codex configuration. Each label combines a model with a reasoning effort; for example, **Luna Max** means GPT-5.6 Luna with Max reasoning. Availability can vary by account and client.

Treat the percentages as starting targets, not quotas. When unsure, use **Terra High**. Switch to **Luna Max** when the plan, acceptance criteria, relevant paths, and verification commands are clear. Luna Max favors cost/quota throughput on well-specified work but can use more tokens, steps, and time; Terra High favors interactive iteration.

1. **Plan - ~10%: Sol High**
   Define the architecture, relevant paths, implementation steps, edge cases, and acceptance criteria.
2. **Implement - ~75% total**
   - **Luna Max - ~45%:** Execute a clear, well-specified plan.
   - **Terra High - ~30%:** Explore the repository and adapt while handling ambiguity or changing requirements.
3. **Test / clean up - ~8%: Luna High**
   The implementing model remains responsible for running relevant verification. Use Luna High for an optional mechanical cleanup pass: tests, lint, type errors, and straightforward bugs.
4. **Hard implementation - ~5%: Terra Max**
   Escalate when the normal implementation routes are not producing a correct result.
5. **Extreme / stuck - ~2%: Astra Max**
   Reserve for genuinely difficult failures.

### Daily drivers

About 75% of coding should use two routes:

- **Luna Max - ~45%:** planned execution.
- **Terra High - ~30%:** the default selection for interactive or ambiguous work.

If you remember only three routes:

- **Sol High:** think.
- **Luna Max:** build.
- **Terra High:** explore and interact.

## Start a project

A repository created from this template is not implementation-ready until project-specific setup is complete.

1. Create a repository from this template.
2. Complete `docs/PRODUCT.md`.
3. Complete `docs/ARCHITECTURE.md`, including the repository map and system boundaries.
4. Configure `docs/TESTING.md` with real project verification commands and remove irrelevant placeholders.
5. Review and update `docs/CURRENT_STATE.md`.
6. For non-trivial work, create a task from `docs/tasks/TEMPLATE.md` and place it in `docs/tasks/active/` when useful.
7. Use the task spec as the implementation handoff. When completed, set its status to `Completed` and move it to `docs/tasks/completed/`.
8. Add project-specific CI only after real verification commands exist.

## Repository structure

```text
codex-project-template/
|-- AGENTS.md                         durable agent rules and workflow
|-- README.md                         template purpose and bootstrap
|-- .gitignore                        common local files and secrets
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
