#!/bin/sh
# Stop hook: best-effort auto-commit and push tracked config changes.
# Stop hooks must not print plain text; emit JSON only at the end.

sync_codex() {
  cd "$HOME/.codex" 2>/dev/null || return 0
  [ -d .git ] || return 0

  [ -n "$(git status --porcelain)" ] || return 0

  git add \
    .gitignore \
    AGENTS.md \
    README.md \
    RTK.md \
    config.toml \
    engram-compact-prompt.md \
    engram-instructions.md \
    hooks.json \
    hooks \
    requirements-dev.txt \
    rules \
    skills/codex-workflow \
    skills/codex-knowledge \
    version.json \
    >/dev/null 2>&1

  git diff --cached --quiet && return 0

  git commit -m "auto: sync $(date '+%Y-%m-%d %H:%M')" >/dev/null 2>&1 || return 0
  (git push --quiet >/dev/null 2>&1 &) 2>/dev/null
}

sync_knowledge() {
  KN="$HOME/Obsidian/Work/Knowledge"
  [ -d "$KN/.git" ] || return 0

  [ -n "$(git -C "$KN" status --porcelain)" ] || return 0

  git -C "$KN" add -A >/dev/null 2>&1
  git -C "$KN" diff --cached --quiet && return 0

  git -C "$KN" commit -m "auto: sync $(date '+%Y-%m-%d %H:%M')" >/dev/null 2>&1 || return 0
  (git -C "$KN" push --quiet >/dev/null 2>&1 &) 2>/dev/null
}

sync_codex
sync_knowledge

printf '{"continue":true}\n'
