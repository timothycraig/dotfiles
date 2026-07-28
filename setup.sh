#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

stow .

# Claude Code reads ~/.claude, not ~/.config, so that package gets its own
# target. --no-folding keeps hooks/ a real directory: without it stow links
# the whole dir into this repo and anything Claude writes there lands in git.
mkdir -p ~/.claude
stow --no-folding --target="$HOME/.claude" claude

# delta reads bat's compiled theme cache, so bat/themes/*.tmTheme only takes
# effect after a build. The cache lives in ~/.cache/bat (derived, not in git).
# Re-run this after upgrading bat: a stale themes.bin silently falls back to
# the default theme.
if command -v bat >/dev/null; then
  bat cache --build
fi
