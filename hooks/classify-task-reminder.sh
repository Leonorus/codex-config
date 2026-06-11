#!/bin/sh
# UserPromptSubmit hook: remind Codex/Hermes-style runtimes to route
# substantial tasks through Workflow MCP when available.

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": "Workflow: for substantial software/ops/debug/research/repo-maintenance, call mcp_workflow_start_task(prompt,cwd,repo) first; state/override bucket, load returned skills, follow contract/context/delegation/finish checklist. Use Workflow MCP and Obsidian via mcp__docker_gateway.obsidian_* before Obsidian claims and for workflow note reads/writes. Finish non-trivia with mcp_workflow_finish_checklist. Fallback: codex-workflow. Prefer RTK-prefixed shell commands when practical, per RTK.md."
  }
}
EOF
