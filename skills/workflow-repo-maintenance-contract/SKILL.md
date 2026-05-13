---
name: workflow-repo-maintenance-contract
description: "Strict contract for dependencies, CI cleanup, docs cleanup, release metadata, and repository convention maintenance."
---

# Repo-maintenance workflow contract

Use this when Workflow MCP or `codex-workflow` classifies the task as `Repo-maintenance`. This is a compact contract, not a prose tutorial.

## First move

Check git status/diff and preserve unrelated user changes.

## Context required

Inspect affected areas: CI, dependencies, docs, tests, release metadata, config conventions, and project instructions.

## Forbidden early actions

- Do not stage or rewrite unrelated changes.
- Do not create commits/branches without the required Jira/project convention unless explicitly bypassed.
- Do not fix unrelated issues inline.

## Verification required

- Run affected checks by surface: CI syntax, dependency tests, docs references, release metadata checks, diff check.
- Report unrelated findings separately.

## Finish condition

State changed surfaces, verification, unrelated changes preserved, docs/notes/skill updates or why none.

## When to escalate bucket

- Workflow policy/hooks/MCP/config surfaces changed: reasoning guard and surface validation.
- Production/runtime config or secrets appear: Heavy Ops.

## When to use subagents

Split independent read-only inspectors for CI/deps/docs/tests/release metadata when useful.
