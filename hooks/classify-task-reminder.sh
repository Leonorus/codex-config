#!/bin/sh
# UserPromptSubmit hook: remind Codex to route substantial tasks through the
# Codex workflow skill before responding.

cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": "For substantial software, DevOps, infrastructure, debugging, research, or repo-maintenance tasks: use the codex-workflow skill first, state the bucket out loud, then apply the matching weight. Skip only for casual chat, simple factual answers, or clear follow-ups to an already-classified task. Prefer RTK-prefixed shell commands when practical, per RTK.md."
  }
}
EOF
