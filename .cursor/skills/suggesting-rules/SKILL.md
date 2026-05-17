---
name: suggesting-rules
description: "Promote repeated corrections into project rules. Use after @Memory-Manager or when same mistake happens twice."
---

# Suggesting rules

When a lesson is repeatable:

1. Propose a **small** `.mdc` or profile.rules.txt addition (not a monolith).
2. Max 30 lines; `alwaysApply: false` unless global behavior (then prefer architect-trigger pattern).
3. Run `scripts/validate-rules.sh` on the target project before recommending commit.
4. Record proposal in manifest `observations` or memory `lessonsLearned`.

@Template-Architect owns kit repo changes; @Memory-Manager owns target project suggestions.
