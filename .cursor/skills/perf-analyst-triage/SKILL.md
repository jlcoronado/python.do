---
name: perf-analyst-triage
description: "@Perf-Analyst — Quick performance triage checklist."
---

# @Perf-Analyst — Triage skill

1. Identify hot path (UI, API, DB, background jobs).
2. Check manifest `verifyCommands` and existing caching/health config.
3. Measure before optimizing (logs, traces, simple benchmarks).
4. Propose smallest change with measurable acceptance criteria.
5. Escalate to @Architect if cross-layer trade-off.
