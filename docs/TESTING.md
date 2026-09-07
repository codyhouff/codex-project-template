# Testing and Verification

## Philosophy
Use the narrowest verification that gives adequate confidence for the risk of the change. Escalate from targeted checks to broad suites only when necessary.

## Commands
<!-- Replace these placeholders with real commands as soon as the tech stack is initialized. -->

| Check | Command | When to run |
| --- | --- | --- |
| Targeted tests | TBD | Every behavior-changing edit |
| Unit tests | TBD | Normal feature / bug work |
| Typecheck | TBD | When the stack supports static checking |
| Lint | TBD | Normal code changes |
| Integration | TBD | Cross-component behavior |
| E2E | TBD | High-risk user flows |
| Repository verify | `./scripts/verify.sh` | Final verification once configured |

## Verification ladder
1. Reproduce or understand the target behavior.
2. Run the narrowest relevant test/check.
3. Implement the change.
4. Re-run the targeted check.
5. Add type/lint checks where useful.
6. Run integration/E2E only when justified by scope/risk.

## Rules
- Do not claim success for checks that were not run.
- Do not hide failing unrelated tests; distinguish pre-existing failures from regressions.
- Prefer deterministic automated checks when practical.
