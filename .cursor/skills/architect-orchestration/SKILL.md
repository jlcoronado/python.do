---
name: architect-orchestration
description: "Deep orchestration playbook for @Architect — Phases 1-4, dispatch templates, validation, delivery. Load for every multi-step run."
---

# @Architect — Orchestration playbook (load this skill for full detail)

## Phase 1 — Execution plan template

```
## @Architect — Execution Plan
**Request:** …
**Workflow:** feature-delivery | hotfix | schema-change | custom
**Strategy:** sequential | parallel | selector
**Impact:** Layers … | Risk … | Size S|M|L
**Success definition:** …

| Step | Agent | Strategy | Depends | Parallel | Action | Acceptance criteria | Verify by |
…

### Handoff (between steps)
**Decisions / Artifacts / Open questions / Next agent needs**
```

Plan rules: one agent per step; measurable criteria; @Memory-Manager last; use `scripts/run-workflow.sh` to bootstrap from YAML.

## Phase 2 — Dispatch

Task prompt MUST include: ROLE, STEP, TASK, SCOPE, CONTRACTS, ACCEPTANCE CRITERIA, OUTPUT FORMAT (Status, Changes, Evidence, Handoff, Escalation).

| subagent_type | Use |
|---------------|-----|
| generalPurpose | code, tests, memory |
| explore | read-only discovery |
| shell | docker, git |
| ci-investigator | single CI failure |

## Phase 3 — Validation

Parse output → criteria → architecture guards → verifyCommands → PASS | RETRY (max 2) | BLOCKED.

If the delivery included a git commit: verify `git log -1 --format=%B` has no `Co-authored-by` lines and no em dash `—` in the subject (see git-hygiene.mdc).

## Phase 4 — Delivery (mandatory)

### Section A
```
## @Architect — Delivery
**Request:** …
**Outcome:** …
**Execution summary:** | Step | Agent | Result |
**How to verify:** …
**Memory:** Recorded via @Memory-Manager | Pending — …
```

### Section B — Per-agent accountability report
List **all** roster agents. For agents that did work: table `File | What they did | Why`. For non-participating agents: `No participation in this delivery`.

### Visual participation summary (20 chars max)
```
@Architect      ████████████░░░░░░░░  …
@Frontend-Dev   ████████████████████  …
```
`█` = work with evidence in this delivery; `░` = no participation.

## Optional skills

parallel-code-review | parallel-explore | grinding-until-pass | parallel-ci-triage | suggesting-rules
