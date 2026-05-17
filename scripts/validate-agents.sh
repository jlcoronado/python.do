#!/usr/bin/env bash
# Post-install golden checks for Agent Orchestration Kit (AOK).

set -euo pipefail

TARGET="${1:-.}"
TARGET="$(cd "${TARGET}" && pwd)"
ERRORS=0

if [[ -z "${MANIFEST_PATH:-}" ]]; then
  for candidate in \
    .architecture/ProjectManifest.json5 \
    .architecture/AILCoreManifest.json5; do
    [[ -f "${TARGET}/${candidate}" ]] && MANIFEST_PATH="${candidate}" && break
  done
  if [[ -z "${MANIFEST_PATH:-}" ]]; then
    for m in "${TARGET}"/.architecture/*Manifest*.json5; do
      [[ -f "${m}" ]] && MANIFEST_PATH="${m#${TARGET}/}" && break
    done
  fi
fi
export MANIFEST_PATH

err() { printf 'ERROR: %s\n' "$*" >&2; ERRORS=$((ERRORS + 1)); }
ok() { printf 'OK: %s\n' "$*"; }

REQUIRED_MDC=(
  architect.mdc
  architect-trigger.mdc
  karpathy-guidelines.mdc
  backend-dev.mdc
  frontend-dev.mdc
  template-architect.mdc
  memory-manager.mdc
)

for f in "${REQUIRED_MDC[@]}"; do
  if [[ ! -f "${TARGET}/.cursor/rules/${f}" ]]; then
    err "Missing .cursor/rules/${f}"
  else
    ok "Found ${f}"
  fi
done

[[ -f "${TARGET}/.cursorrules" ]] || err "Missing .cursorrules"
[[ -f "${TARGET}/${MANIFEST_PATH:-.architecture/ProjectManifest.json5}" ]] || err "Missing manifest"

if [[ -d "${TARGET}/.architecture/workflows" ]]; then
  ok "Workflows directory present"
else
  err "Missing .architecture/workflows (re-run install.sh from AOK 1.1+)"
fi

if [[ -d "${TARGET}/.cursor/skills" ]]; then
  ok "Skills directory present"
else
  err "Missing .cursor/skills"
fi

# Golden content checks
golden_check() {
  local file="$1"
  local needle="$2"
  local label="$3"
  if grep -qF "${needle}" "${file}" 2>/dev/null; then
    ok "Golden: ${label} in $(basename "${file}")"
  else
    err "Golden missing ${label} in ${file}"
  fi
}

[[ -f "${TARGET}/.cursor/rules/architect.mdc" ]] && {
  golden_check "${TARGET}/.cursor/rules/architect.mdc" "architect-orchestration" "slim architect + skill"
  golden_check "${TARGET}/.cursor/rules/architect.mdc" "run-workflow" "workflow launcher"
  golden_check "${TARGET}/.cursor/rules/architect.mdc" "Strategy" "strategy tag"
  golden_check "${TARGET}/.cursor/rules/architect.mdc" "feature-delivery" "workflows"
}
SKILL_ORCH="${TARGET}/.cursor/skills/architect-orchestration/SKILL.md"
[[ -f "${SKILL_ORCH}" ]] && golden_check "${SKILL_ORCH}" "Handoff" "handoffs in skill"
[[ -f "${TARGET}/AGENTS.md" ]] && ok "AGENTS.md roster present"
[[ -f "${TARGET}/.architecture/kit.meta.json5" ]] && ok "kit.meta.json5 present"
[[ -f "${TARGET}/.cursor/rules/backend-dev.mdc" ]] && \
  golden_check "${TARGET}/.cursor/rules/backend-dev.mdc" "Anti-hallucination" "backend anti-hallucination"
[[ -f "${TARGET}/.cursor/rules/frontend-dev.mdc" ]] && \
  golden_check "${TARGET}/.cursor/rules/frontend-dev.mdc" "Anti-hallucination" "frontend anti-hallucination"
[[ -f "${TARGET}/.cursor/rules/dba.mdc" ]] && \
  golden_check "${TARGET}/.cursor/rules/dba.mdc" "Anti-hallucination" "dba anti-hallucination"
[[ -f "${TARGET}/.cursor/rules/infra-architect.mdc" ]] && \
  golden_check "${TARGET}/.cursor/rules/infra-architect.mdc" "ADR before change" "ADR infra"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -x "${SCRIPT_DIR}/validate-rules.sh" ]]; then
  "${SCRIPT_DIR}/validate-rules.sh" "${TARGET}" || ERRORS=$((ERRORS + 1))
fi

[[ -d "${TARGET}/.cursor/rules/packs" ]] && ok "Optional rules packs directory present"

[[ "${ERRORS}" -eq 0 ]] || exit 2
printf 'validate-agents: all checks passed\n'
exit 0
