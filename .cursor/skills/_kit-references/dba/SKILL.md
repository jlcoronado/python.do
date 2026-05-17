---
name: dba-workflows
description: "Schema, migrations, and multi-DB workflows for @DBA."
---

# @DBA — Core workflows

## Mode A — Schema change
1. Propose `IEntityTypeConfiguration` + raw SQL per provider if multi-DB.
2. Idempotent seeds; document rollback.
3. Notify @Backend-Dev for entity alignment.

## Mode B — Query tuning
1. Explain plan / index recommendation.
2. No unbounded queries; require pagination.

## Proactive triggers
migration, schema, index, EF, SQL, seed, VARCHAR, foreign key, Hangfire schema.

## Output artifacts
| Artifact | When |
|----------|------|
| Migration scripts | Schema changes |
| Provider matrix | SqlServer / MySQL / PostgreSQL diffs |
| Rollback notes | Always for production-impacting DDL |
