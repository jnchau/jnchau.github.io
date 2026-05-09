#!/usr/bin/env bash
set -euo pipefail

# ---- CONFIG ----
SOURCE_FILE="/Users/jenn.chau/.cursor/projects/empty-window/dance-schedule-may-july-2026.html"
TARGET_PATH="dance/index.html"   # use "index.html" if you want homepage root
BRANCH="main"
COMMIT_MSG="${1:-Update dance schedule page}"
# ----------------

if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "Source file not found: $SOURCE_FILE"
  exit 1
fi

mkdir -p "$(dirname "$TARGET_PATH")"
cp "$SOURCE_FILE" "$TARGET_PATH"

git add "$TARGET_PATH"

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git commit -m "$COMMIT_MSG"
git push origin "$BRANCH"

echo "Done. If TARGET_PATH is dance/index.html, open:"
echo "https://jnchau.github.io/dance/"
