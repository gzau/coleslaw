#!/usr/bin/env bash
# coleslaw installer for Cursor.
#
# Default: registers the skill globally.
#   ~/.cursor/skills/coleslaw/SKILL.md
#   Invoke with /coleslaw or "use coleslaw".
#
# With --always-on: also makes coleslaw active automatically in the current repo.
#   ./.cursor/rules/coleslaw.mdc   (alwaysApply: true)
#
# Flags:
#   --always-on    Make coleslaw always active in the current repo (no /coleslaw needed).
#   --uninstall    Remove installed files.
#   -h, --help     Show this help.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_SRC="$REPO_ROOT/skills/coleslaw/SKILL.md"

USER_DEST="$HOME/.cursor/skills/coleslaw/SKILL.md"
REPO_DEST="$PWD/.cursor/rules/coleslaw.mdc"

ALWAYS_ON=0
UNINSTALL=0

usage() { sed -n '2,15p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --always-on) ALWAYS_ON=1; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    -h|--help)   usage; exit 0 ;;
    *) echo "cursor.sh: unknown flag: $1" >&2; usage; exit 1 ;;
  esac
done

[[ ! -f "$SKILL_SRC" ]] && { echo "cursor.sh: skill not found at $SKILL_SRC" >&2; exit 1; }

if [[ $UNINSTALL -eq 1 ]]; then
  echo "cursor: uninstalling..."
  [[ -e "$HOME/.cursor/skills/coleslaw" ]] && rm -rf "$HOME/.cursor/skills/coleslaw" && echo "  removed: $HOME/.cursor/skills/coleslaw"
  [[ -e "$REPO_DEST" ]] && rm -f "$REPO_DEST" && echo "  removed: $REPO_DEST"
  echo "cursor: done."
  exit 0
fi

echo "cursor: registering globally..."
mkdir -p "$(dirname "$USER_DEST")"
cp "$SKILL_SRC" "$USER_DEST"
echo "  installed: $USER_DEST"

if [[ $ALWAYS_ON -eq 1 ]]; then
  echo "cursor: enabling always-on for this repo..."
  mkdir -p "$(dirname "$REPO_DEST")"
  {
    echo "---"
    echo "description: coleslaw output style for clear, structured AI responses"
    echo "alwaysApply: true"
    echo "---"
    echo
    cat "$SKILL_SRC"
  } > "$REPO_DEST"
  echo "  installed: $REPO_DEST"
  echo "cursor: done. coleslaw is now active by default in this repo."
else
  echo "cursor: done. invoke with /coleslaw or 'use coleslaw'."
fi
