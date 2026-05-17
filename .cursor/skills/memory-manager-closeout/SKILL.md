---
name: memory-manager-closeout
description: "@Memory-Manager — Close orchestrated tasks: manifest, memory, CHANGELOG."
---

# @Memory-Manager — Closeout skill

After @Architect orchestration:

1. Update `ProjectMemory.json5` session log (decisions, lessons).
2. Move resolved `pendingDecisions` → `decisionsLog` in manifest.
3. Append `CHANGELOG.md` for user-facing changes.
4. Never commit secrets; warn if `.env` touched.
5. Hand back: what was recorded + paths updated.
