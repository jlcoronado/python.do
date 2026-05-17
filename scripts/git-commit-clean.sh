#!/bin/sh
# Create a commit without Co-authored-by trailers (Cursor often injects them into git commit).
# Usage: scripts/git-commit-clean.sh "type: subject line"
set -e
if [ $# -lt 1 ]; then
  echo "usage: scripts/git-commit-clean.sh \"commit message\"" >&2
  exit 1
fi
if [ -z "$(git diff --cached --name-only)" ]; then
  echo "nothing staged; git add files first" >&2
  exit 1
fi
tree=$(git write-tree)
parent=$(git rev-parse HEAD)
commit=$(printf '%s\n' "$1" | git commit-tree "$tree" -p "$parent")
git update-ref HEAD "$commit"
git reset --mixed HEAD
echo "created $(git rev-parse --short HEAD): $1"
