# Codex Workflow

This is the human-facing routing guide. Model availability, pricing, and limits can change; revisit the routing periodically.

## Default routing

| Approx. share | Model | Route here when... |
| ---: | --- | --- |
| 45% | GPT-5.6 Luna Max | The plan is clear and acceptance criteria are explicit. Bulk implementation, repetitive execution, well-scoped features. |
| 30% | GPT-5.6 Terra High | The task is under-specified, interactive, exploratory, or requires repo discovery and judgment while coding. |
| 10% | GPT-5.6 Sol High | Planning, architecture, decomposition, difficult reasoning, or strong final review. |
| 8% | GPT-5.6 Luna High | Tests, lint/type fixes, routine bugs, mechanical cleanup. |
| 5% | GPT-5.6 Terra Max | Hard implementation that the daily workers fail or mishandle. |
| 2% | GPT-6 Astra Max | Rare rescue after the normal escalation ladder fails. |

## Preferred loop

### 1. Plan — Sol High
For a non-trivial feature, produce or refine a file under `docs/tasks/active/` with:
- goal and context;
- relevant code / likely files;
- implementation plan;
- acceptance criteria;
- verification plan;
- risks / edge cases.

### 2. Implement — Luna Max or Terra High
Use **Luna Max** when the task file is strong enough that implementation should be mostly execution.

Use **Terra High** when the agent still needs to discover intent, trace code paths, decide among approaches, or interactively adapt the implementation.

### 3. Verify / clean up — Luna High
Use targeted tests, typecheck/lint, and routine fixes. Keep verification proportional to risk.

### 4. Escalate — Terra Max
Escalate hard implementation before jumping directly to a frontier rescue model.

### 5. Rescue — Astra Max
Use only when the normal ladder has failed or the task genuinely needs frontier reasoning.

## Handoff rule
The most valuable artifact between planning and implementation is a good task spec, not a huge chat transcript. Prefer passing the task file plus relevant repo context.
