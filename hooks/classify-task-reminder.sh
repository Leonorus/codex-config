#!/bin/sh
# UserPromptSubmit hook: remind Codex to route substantial tasks through the
# Codex workflow skill before responding.

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": "For substantial software, DevOps, infrastructure, debugging, research, or repo-maintenance tasks: load and use the codex-workflow skill first, state the bucket out loud, then apply the matching weight. Skip only for casual chat, simple factual answers, or clear follow-ups to an already-classified task. For Ops/Infra, Debug, architecture choices, and reusable research, consult codex-workflow's Obsidian Knowledge Workflow (or codex-knowledge where that skill is active) and read directly relevant Obsidian notes before proposing an approach. For substantial buckets, prefer evidence-gated reasoning over token thrift; extra thinking, tool calls, context gathering, and subagents are acceptable when they improve correctness, reasoning quality, speed to verified result, or reduce failures. Prefer RTK-prefixed shell commands when practical, per RTK.md."
  }
}
EOF
