---
name: parallel-explore
description: "Parallel codebase exploration for onboarding or large refactors. Use when @Architect needs layer map before planning."
---

# Parallel explore

Split the repo by manifest `architecture.layers` or `domainBoundaries.treeFocus`. Dispatch one `explore` subagent per zone:

- Domain / core
- Application / services
- Infrastructure / data
- UI / host

Each returns: folder purpose, key entry points, risks, suggested agent for changes. @Architect merges into execution plan scope columns.
