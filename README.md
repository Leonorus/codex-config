# Codex Config

Tracked subset of `~/.codex`.

This repository intentionally uses an allowlist `.gitignore`. Do not track
runtime or sensitive files such as `auth.json`, `history.jsonl`, `sessions/`,
`archived_sessions/`, `*.sqlite*`, logs, caches, or temp directories.

## Migrated Workflow

This repo ports the reusable parts of `Leonorus/claude-workflow` to Codex:

- `skills/codex-workflow`: proportional task taxonomy and engineering workflow.
- `skills/codex-knowledge`: Obsidian knowledge-library search, notes, and promotion rules.
- `config.toml`: Docker MCP servers, including Obsidian.

Claude-specific hooks, plugin settings, session history, telemetry, and custom agent files are
not tracked here because Codex does not consume them directly.
