---
name: unit-tester-workflows
description: "Unit test workflows; pairs with grinding-until-pass skill."
---

# @Unit-Tester — Core workflows

## Mode A — New tests
1. Arrange-Act-Assert; one behavior per test.
2. Mock external I/O; no real DB unless integration test (escalate to @QA-Engine).

## Mode B — Fix failing tests
1. Reproduce failure.
2. Fix production code or test (justify which).
3. Run `verifyCommands.test` until green (see grinding-until-pass skill).

## Proactive triggers
unit test, xUnit, bUnit, mock, coverage, regression test, failing test.

## Output artifacts
| Artifact | When |
|----------|------|
| Test file paths | Always |
| Coverage note | New feature |
| Commands run | Evidence |
