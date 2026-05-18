# Codex Config

Tracked subset of `~/.codex`.

This repository intentionally uses an allowlist `.gitignore`. Do not track
runtime or sensitive files such as `auth.json`, `history.jsonl`, `sessions/`,
`archived_sessions/`, `*.sqlite*`, logs, caches, or temp directories.

## Migrated Workflow

This repo ports the reusable parts of `Leonorus/claude-workflow` to Codex:

- `skills/codex-workflow`: proportional task taxonomy, engineering workflow, and evidence-gated reasoning guards.
- `skills/codex-knowledge`: Obsidian knowledge-library search, notes, and promotion rules.
- `config.toml`: MCP servers, including Obsidian and Engram.
- `engram-instructions.md`: persistent-memory protocol loaded by Codex.
- `hooks.json` and `hooks/`: Codex-native lifecycle hooks ported from Claude where supported.
- `RTK.md`: RTK usage instructions for Codex shell commands.

Claude-specific hooks, plugin settings, session history, telemetry, and custom agent files are
not tracked here because Codex does not consume them directly.

## Hook Porting Notes

Claude hook equivalents ported to Codex:

- `SessionStart`: emits a trigger-only Obsidian reminder; it does not read vault indexes or inject note candidates.
- `UserPromptSubmit`: injects the compact workflow reminder: Workflow: for substantial software/ops/debug/research/repo-maintenance, call mcp_workflow_start_task(prompt,cwd,repo) first; state/override bucket, load returned skills, follow contract/context/delegation/finish checklist. Use Workflow/Obsidian MCP before Obsidian claims and for workflow note writes. Finish non-trivia with mcp_workflow_finish_checklist. Fallback: codex-workflow.
- `Stop`: auto-syncs tracked `~/.codex` config and `~/Obsidian/Work/Knowledge`.

Not ported 1:1:

- Claude `PostToolUse` edit hooks for `ansible-lint` and `terraform fmt`: current Codex hooks only emit Bash tool events, not file edits. The verification requirement lives in `AGENTS.md` and `codex-workflow` instead.
- Claude `PreToolUse` RTK rewrite hook: current Codex hooks do not support command rewriting. RTK is installed through `RTK.md`; use `rtk <command>` when practical.

## Skill Validation

The bundled skill validator requires `PyYAML`. Use a local venv:

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements-dev.txt
.venv/bin/python skills/.system/skill-creator/scripts/quick_validate.py skills/codex-workflow
.venv/bin/python skills/.system/skill-creator/scripts/quick_validate.py skills/codex-knowledge
```
