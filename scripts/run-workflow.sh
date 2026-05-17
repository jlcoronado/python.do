#!/usr/bin/env bash
# BAOK 1.x — Run a named workflow: plan table + optional @Architect prompt for Cursor.

set -euo pipefail

WORKFLOW=""
USER_REQUEST=""
EMIT_PROMPT=0
LIST=0

usage() {
  cat <<'EOF'
Usage: run-workflow.sh <workflow.yaml> [options]

Options:
  --prompt "text"   User feature request — emit copy-paste @Architect message
  --list            List workflows in .architecture/workflows/
  -h, --help

Examples:
  ./scripts/run-workflow.sh .architecture/workflows/feature-delivery.yaml
  ./scripts/run-workflow.sh .architecture/workflows/hotfix.yaml --prompt "Fix login timeout on mobile"
EOF
  exit "${1:-0}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --prompt) USER_REQUEST="$2"; EMIT_PROMPT=1; shift 2 ;;
    --list) LIST=1; shift ;;
    -h|--help) usage 0 ;;
    *)
      if [[ -z "${WORKFLOW}" ]]; then WORKFLOW="$1"; shift; else echo "Unknown: $1"; usage 1; fi
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

if [[ "${LIST}" -eq 1 ]]; then
  find "${ROOT}/template/workflows" "${ROOT}/.architecture/workflows" 2>/dev/null -name '*.yaml' | sort
  exit 0
fi

[[ -n "${WORKFLOW}" && -f "${WORKFLOW}" ]] || { echo "Workflow file required"; usage 1; }

"${SCRIPT_DIR}/workflows-to-plan.sh" "${WORKFLOW}"

if [[ "${EMIT_PROMPT}" -eq 1 ]]; then
  WF_NAME="$(python3 -c "import yaml,sys; print(yaml.safe_load(open(sys.argv[1]))['name'])" "${WORKFLOW}")"
  cat <<EOF

---
## Copy into Cursor chat (@Architect)

@Architect — Run workflow **${WF_NAME}** end to end.

**Request:** ${USER_REQUEST}

**Instructions:**
1. Use the plan above as a base (adjust acceptance criteria to context).
2. Full orchestration: Task per step, validation, grind-until-pass on build/test.
3. Deliver Phase 4 Section A + B (per-agent accountability report).
4. Close with @Memory-Manager.

**Workflow file:** \`${WORKFLOW}\`
EOF
fi
