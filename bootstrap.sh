#!/usr/bin/env bash
# Set this Mac up from scratch. Idempotent; safe to re-run after changes.
#
# Usage:
#   ./bootstrap.sh             # brew bundle + stow
#   ./bootstrap.sh --macos     # also apply macOS defaults
#   ./bootstrap.sh --clone     # also clone personal repos via clone.sh

set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# 1. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Brewfile
brew bundle --file="$DOTFILES/Brewfile"

# 3. Stow home/ into $HOME
stow --target="$HOME" --dir="$DOTFILES" --restow home

# 4. Optional: macOS defaults
if [[ " $* " == *" --macos "* ]]; then
  source "$DOTFILES/.macos"
fi

# 5. Optional: clone personal repos
if [[ " $* " == *" --clone "* ]]; then
  "$DOTFILES/clone.sh"
fi

echo "Done. Open a new terminal to pick up shell changes."
