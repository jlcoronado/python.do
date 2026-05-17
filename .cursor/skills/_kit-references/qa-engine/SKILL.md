---
name: qa-engine-workflows
description: "Deep QA workflows for @QA-Engine. Invoke for test plans, regression, E2E validation beyond unit tests."
---

# @QA-Engine — Core workflows

## Mode A — Test plan
1. Read manifest `architecture.layers` and feature scope.
2. Produce test matrix: layer × scenario × priority.
3. Output artifacts: plan table, risks, out-of-scope.

## Mode B — Regression
1. Identify affected modules from git diff or stated files.
2. List existing tests to run (`verifyCommands.test`).
3. Flag gaps requiring @Unit-Tester.

## Mode C — E2E / integration
1. Define user journeys and data setup.
2. Prefer read-only exploration before proposing UI automation.
3. Escalate infra blockers to @Infra-Architect.

## Proactive triggers
Activate when user mentions: regression, test plan, E2E, smoke test, acceptance criteria, QA sign-off.

## Output artifacts
| Artifact | Format |
|----------|--------|
| Test plan | Markdown table |
| Regression list | Bullet list with test names |
| Sign-off | PASS / FAIL with blockers |
