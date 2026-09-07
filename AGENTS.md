# Repository Guide

## Purpose
This repository uses a lightweight, spec-driven workflow optimized for coding agents. Keep this file concise; durable product, architecture, testing, and task details belong in `docs/`.

## Read First
Before making a non-trivial change, read only the smallest relevant context:
- Product behavior, scope, or constraints → `docs/PRODUCT.md`.
- Architecture, code boundaries, or design choices → `docs/ARCHITECTURE.md`.
- Verification commands or testing strategy → `docs/TESTING.md`.
- Migrations, known issues, or current limitations → `docs/CURRENT_STATE.md`.
- Active implementation work → the relevant file under `docs/tasks/active/`.

Do not load every document by default. Prefer the smallest context set that is sufficient.

## Working Rules
- Inspect the relevant code and nearby patterns before editing.
- Prefer the smallest correct change that satisfies the task.
- Do not perform unrelated refactors or formatting churn.
- Preserve public behavior unless the task explicitly changes it.
- Do not add dependencies unless they materially simplify or enable the requested work.
- Do not edit generated/vendor files manually unless the repository explicitly requires it.
- Never claim a command or test passed unless it was actually run successfully.
- Preserve pre-existing user/working-tree changes. Do not use git reset, git clean, revert, destructive overwrite, history rewriting, or deletion to obtain a clean working tree unless explicitly requested.
- Do not commit, push, or force-push unless explicitly asked.
- Never expose secrets, credentials, tokens, private keys, or sensitive local files.

## Implementation Workflow
For non-trivial work:
1. Understand the goal and acceptance criteria.
2. Inspect the relevant code paths and tests.
3. If no adequate task spec exists, create or refine one from `docs/tasks/TEMPLATE.md` before large implementation work.
4. Implement in small, coherent changes.
5. Run the narrowest relevant verification first.
6. Review the diff for regressions, unnecessary complexity, and unrelated changes.
7. For substantial or high-risk changes, use a fresh-context or dedicated review before delivery.
8. Run the final verification appropriate to the risk of the change.
9. Summarize what changed, what was verified, and any remaining risks.

## Git Delivery
When Git or GitHub delivery is explicitly requested:
- Perform only the requested delivery actions; authorization to commit does not imply authorization to push, open a PR, or merge.
- For branch-based delivery, use a task-specific branch or isolated worktree; do not work directly on the default branch.
- Run relevant verification and review the complete branch diff before committing.
- Stage only task-related changes and use a concise commit message.
- When opening a PR, use the repository template and include verification evidence.
- Do not merge unverified or failing work or bypass required checks or reviews.
- Enable auto-merge only when explicitly requested and repository protections enforce the required gates.

## Verification
Verification should be proportional to risk.

- Small/local change: targeted test(s), plus typecheck/lint when relevant.
- Normal feature: targeted tests + typecheck/lint + relevant integration checks.
- High-risk or cross-cutting change: broader integration/E2E checks when justified.

Project-specific verification commands belong in `docs/TESTING.md`. If commands are unconfigured or were not run, report verification as unverified. Do not treat placeholders as passing checks.
Do not repeatedly run an expensive full suite when a narrower check provides adequate signal.

## Documentation
Update durable docs only when the change alters durable truth:
- architecture or boundaries → `docs/ARCHITECTURE.md`
- product behavior/scope → `docs/PRODUCT.md`
- verification procedure → `docs/TESTING.md`
- current migration/known-state facts → `docs/CURRENT_STATE.md`
- significant irreversible design choice → add an ADR under `docs/decisions/`

Avoid documenting temporary implementation chatter.

## Done When
A task is done when:
- its acceptance criteria are satisfied;
- relevant verification passes, or any unverified item is clearly disclosed;
- the diff contains no accidental or unrelated changes;
- durable documentation is updated when required;
- remaining risks or follow-ups are explicit.

## Nested Instructions
Add a nested `AGENTS.md` only when a subtree needs materially different commands, constraints, or conventions. Keep local instructions specific and avoid duplicating the root file.
