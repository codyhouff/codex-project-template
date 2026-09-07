#!/usr/bin/env bash
set -euo pipefail

cat >&2 <<'MSG'
ERROR: scripts/verify.sh has not been configured for this project yet.

Replace this script with the project's real final verification commands, for example:
  npm test && npm run typecheck && npm run lint
or:
  pytest -q && ruff check . && mypy src

Do not treat this placeholder as a passing verification.
MSG
exit 2
