---
name: parallel-code-review
description: "Run read-only parallel review lenses before merge. Use when @Architect requests pre-merge review or user asks for security/perf/QA pass."
---

# Parallel code review

When @Architect assigns pre-merge review, dispatch **four** `explore` subagents in one turn:

| Lens | Focus | Maps to agent role |
|------|--------|-------------------|
| Security | Auth, secrets, injection, OWASP | @Security |
| Performance | Hot paths, N+1, caching | @Perf-Analyst |
| Correctness | Logic, edge cases, error handling | @Backend-Dev / @Frontend-Dev |
| Maintainability | Naming, structure, tests | @QA-Engine |

Each subagent returns findings only — **no file edits**. @Architect consolidates into a single review block before merge.
