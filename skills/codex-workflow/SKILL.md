---
name: codex-workflow
description: Classify and run Filipp's proportional Codex engineering workflow. Use at the start of substantial software, DevOps, infrastructure, debugging, research, or repo-maintenance tasks to choose trivia, light ops, heavy ops, app code, script, debug, research, or ambiguous flow; skip for casual chat and simple factual answers.
---

# Codex Workflow

This is the Codex port of the Claude workflow. Apply only the amount of process the task deserves.

## Classify First

For non-trivia work, state the bucket in one short sentence and run that flow:

| Bucket | Signals | Flow |
|---|---|---|
| Trivia | Typo, one-line obvious doc/config fix, mechanical rename | Just do it. No plan, no architecture review, no note. |
| Light Ops | Single-file Ansible/Terraform/k8s/CI/Docker, small diff, no prod boundary, no new role/module/stack | Inspect convention -> edit surgically -> run targeted lint/fmt/check -> summarize. |
| Heavy Ops | Multi-file ops, prod boundary, secrets/network/security, new role/module/stack, architectural shift, repeated pattern | Think before coding -> consult `codex-knowledge` -> plan -> implement -> lint/validate -> dry-run gate before apply -> review -> docs/note. |
| App Code | `go.mod`/`pyproject.toml`, tests present, multiple modules/packages | Define success -> add or run failing test first -> implement -> targeted tests -> review -> docs. |
| Script | Single-file Go/Python glue, run-once or cron, no app test harness | Short plan if non-trivial -> implement minimal script -> smoke-test safe input -> docs if reusable. |
| Debug | Bug report, failing test, stack trace, unexpected behavior | Reproduce -> hypothesize -> instrument/read -> fix the cause -> verify the exact failure is gone. |
| Research | "How does X work", compare options, repo exploration, no code change | Read and report. Write to Obsidian only if useful and user intent warrants it. |
| Ambiguous | Multiple buckets fit or scope is unclear | Ask a concise clarifying question before edits. |

Escalate Light Ops to Heavy Ops if the diff grows beyond roughly 50 lines, spreads across files, touches prod/secrets/network, reveals a deeper design issue, or repeats across multiple repos.

## Always-On Principles

- Think before coding: name the goal, load-bearing assumptions, unknowns, and tradeoffs before edits.
- Simplicity first: implement only what the current request needs; avoid speculative flags, helpers, abstractions, and "nice to have" extras.
- Surgical changes: touch only required lines plus direct wiring/tests; report unrelated issues instead of fixing them inline.
- Goal-driven execution: define "done" as verifiable criteria, run the smallest relevant check first, and only claim success with command evidence.

## Codex-Specific Adaptation

- Do not copy Claude custom-agent routing literally. Codex subagents are only available when the user explicitly asks for delegation/parallel agents; otherwise keep orchestration local and parallelize shell reads with available tooling.
- Use project-local `AGENTS.md` as the durable instruction surface. If a repo has `CLAUDE.md`, migrate relevant project instructions into `AGENTS.md` when safe.
- For OpenAI/Codex docs, use the `openai-docs` skill and official sources.
- Prefer local tools and project conventions over generic workflow steps.

## Review And Finish

Before final response:

- Check `git diff`/`git status` for unintended edits.
- Run relevant verification: tests, lint, formatter, build, dry-run, or smoke check.
- If verification could not run, state the exact blocker.
- For meaningful code/config changes, update affected docs or explain why none were affected.
