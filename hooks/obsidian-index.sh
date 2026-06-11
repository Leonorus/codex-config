#!/bin/sh
# SessionStart hook: trigger-only Obsidian/Workflow MCP reminder.
# Do not read vault indexes or inject note candidates from hooks.

cat <<'EOF'
Obsidian: hook is trigger-only; do not infer or cite note candidates from it. For Ops/Infra/Debug/architecture/reusable research, use Workflow MCP start_task/discover_context or mcp__docker_gateway.obsidian_*, then read matching notes via mcp__docker_gateway.obsidian_* before claims. Vault: ~/Obsidian/Work.
EOF

exit 0
