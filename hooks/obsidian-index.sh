#!/bin/sh
# SessionStart hook: emit a compact index of the Obsidian vault so Codex
# knows what notes exist without reading any of them.

set -u

VAULT="${HOME}/Obsidian/Work"
MAX_LINES=200

[ -d "$VAULT" ] || exit 0

printf '=== Obsidian vault index (%s) ===\n' "$VAULT"
printf 'Use Obsidian MCP tools or filesystem fallback to read matching notes.\n\n'

count=0
find "$VAULT" -type f -name '*.md' 2>/dev/null | sort | while IFS= read -r f; do
  rel="${f#$VAULT/}"
  case "$rel" in
    .*|.obsidian/*) continue ;;
  esac

  tags=$(awk '
    /^---[[:space:]]*$/ { f++; if (f==2) exit; next }
    f==1 && /^tags:/ {
      sub(/^tags:[[:space:]]*/, "")
      print
      exit
    }
  ' "$f" 2>/dev/null)

  if [ -n "$tags" ]; then
    printf -- '- %s %s\n' "$rel" "$tags"
  else
    printf -- '- %s\n' "$rel"
  fi

  count=$((count + 1))
  if [ "$count" -ge "$MAX_LINES" ]; then
    printf '... (truncated at %d notes)\n' "$MAX_LINES"
    break
  fi
done

exit 0
