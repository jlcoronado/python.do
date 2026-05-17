---
name: grinding-until-pass
description: "Iterative fix loop until verifyCommands pass. Use for @Unit-Tester, @Backend-Dev, or @Frontend-Dev implementation steps."
---

# Grinding until pass

For implementation steps with `verify: verifyCommands.test` or `build`:

1. Run verify command from manifest.
2. On failure, fix **only** files in step SCOPE.
3. Re-run verify.
4. Repeat until pass or **max 10** iterations.
5. On iteration 10 fail → `ESCALATION → @Architect:` with last error log.

Record each iteration in step output: `Iteration N: <pass|fail> — <summary>`.
