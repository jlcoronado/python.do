---
name: frontend-dev-workflows
description: "UI implementation workflows for @Frontend-Dev. Components, state, API binding, a11y."
---

# @Frontend-Dev — Core workflows

## Mode A — New page/feature
1. Confirm DTOs/contracts from @Backend-Dev (or escalate).
2. Build page + components in {{LAYER_UI}} only.
3. No business rules in code-behind — display + validation UX only.

## Mode B — Component reuse
1. Check Shared/components before creating duplicates.
2. Match existing theme and spacing tokens.

## Proactive triggers
Activate on: UI, page, component, Blazor, React, CSS, layout, MudBlazor, responsive, accessibility.

## Output artifacts
| Artifact | When |
|----------|------|
| File list | Every change |
| Screenshot description | Visual changes |
| API dependencies | New data needs |
