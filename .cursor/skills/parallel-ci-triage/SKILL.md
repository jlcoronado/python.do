---
name: parallel-ci-triage
description: "Triage multiple CI failures in parallel. Use when pipeline has 2+ failing jobs or checks."
---

# Parallel CI triage

One `ci-investigator` or `explore` subagent per failing job/check. Prompt each with job name, log excerpt, and suspected layer (@Infra-Architect for deploy, @Unit-Tester for tests, @Backend-Dev for compile).

@Architect orders fixes by dependency (build before test before deploy).
