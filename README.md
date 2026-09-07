# Codex Project Template

A lightweight repository template for high-throughput Codex development.

The goal is simple: make the repository easy for coding agents to understand, give planned work a clear handoff format, and make verification explicit without adding a heavy orchestration framework.

## Recommended workflow

| Approx. share | Model | Best use |
| ---: | --- | --- |
| 45% | GPT-5.6 Luna Max | Planned, well-specified implementation / bulk execution |
| 30% | GPT-5.6 Terra High | Ambiguous, exploratory, interactive development |
| 10% | GPT-5.6 Sol High | Planning, architecture, difficult reasoning, strong review |
| 8% | GPT-5.6 Luna High | Tests, lint/type fixes, routine bugs, mechanical cleanup |
| 5% | GPT-5.6 Terra Max | Hard implementation / escalation |
| 2% | GPT-6 Astra Max | Rare rescue / frontier escalation |

Treat these percentages as routing defaults, not quotas. Route by task shape first.

## Start a project

1. Create a repository from this template.
2. Replace the placeholders in `docs/PRODUCT.md` and `docs/ARCHITECTURE.md`.
3. Configure `scripts/verify.sh` for the project's real commands.
4. Update the repository map and commands in `AGENTS.md`.
5. For non-trivial work, create a task from `docs/tasks/TEMPLATE.md`.
6. Use the task spec as the handoff to the implementation model.
7. Move finished task files from `docs/tasks/active/` to `docs/tasks/completed/` when useful.

## Core idea

```text
Sol High plans
    ↓
docs/tasks/active/<task>.md
    ↓
Luna Max implements clear plans
Terra High handles ambiguity / exploration
    ↓
Luna High verifies / cleans up
    ↓
Terra Max / Astra escalate only when needed
```

## Why this stays small

Codex automatically discovers `AGENTS.md` from the repository root down toward the working directory. Keep the root file concise and put durable detail in `docs/`. Add nested `AGENTS.md` files only when a subdirectory genuinely needs different rules.

This repository deliberately avoids a large agent framework, automatic model routing, and dozens of custom roles. Add those only when they solve a demonstrated problem.
