---
name: git-expert-workflow
description: "@Git-Expert — Safe branch, commit, and PR workflow aligned with kit manifest."
---

# @Git-Expert — Workflow skill

1. Read manifest `git` / branch conventions if present.
2. Never force-push `main`/`master` without explicit user request.
3. Commit only when user asked; use HEREDOC messages with a single human-like subject line.
4. Never add `Co-authored-by` or AI trailers. If the IDE injects them, amend or re-commit without them before reporting done.
5. Avoid em dash `—` and AI buzzwords in the subject (harden, leverage, streamline, robust).
6. After commit: `git log -1 --format=%B` and confirm no trailers.
7. Ensure `scripts/install-git-hooks.sh` was run on this clone (pre-commit enforcement).
8. For PRs: `gh pr create` with Summary + Test plan.
9. Report: branch, commits, files changed, next step for @Architect.
