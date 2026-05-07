#!/bin/sh
# UserPromptSubmit hook: remind Codex/Hermes-style runtimes to route
# substantial tasks through Workflow MCP when available.

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": "For substantial software, DevOps, infrastructure, debugging, research, or repo-maintenance tasks: when mcp_workflow_start_task is available, call it first with the prompt/cwd/repo. Treat Workflow MCP as a structured oracle/checklist, not unquestionable authority: state its visible_statement unless user correction or gathered evidence shows the bucket is wrong; then state the corrected bucket and why. Load returned required skills (especially codex-workflow), then follow the relevant contract, candidate notes, delegation hint, reasoning-guard flag, and finish checklist. Use mcp_workflow_discover_context or start_task candidate_notes before Obsidian claims, and mcp_workflow_finish_checklist before finalizing non-trivia work. If Workflow MCP is unavailable, fails, stale, or obviously wrong, fall back to codex-workflow: state the bucket, read directly relevant Obsidian notes for Ops/Infra, Debug, architecture, and reusable research, and prefer evidence-gated reasoning plus useful subagents over token thrift. Prefer RTK-prefixed shell commands when practical, per RTK.md."
  }
}
EOF
