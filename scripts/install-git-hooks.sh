#!/bin/sh
# Install repo git hooks (pre-commit: message hygiene).
set -e
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
git config core.hooksPath scripts/git-hooks
chmod +x scripts/git-hooks/pre-commit
echo "Installed git hooks: core.hooksPath=scripts/git-hooks"
