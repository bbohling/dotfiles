# ~/.zshenv — loaded by zsh for *every* invocation (interactive, non-interactive, login).
# Keep this minimal: PATH and env vars that scripts/IDEs need to see.
# Interactive-only settings (history, prompt, aliases) belong in .zshrc.

export DOTFILES=$HOME/.dotfiles

# Editor. `code --wait` makes git/less block until the file is closed.
export EDITOR="code --wait"
export VISUAL="$EDITOR"

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Runtime homes (used by other tools to find the binaries even from non-interactive shells)
export VOLTA_HOME="$HOME/.volta"
export BUN_INSTALL="$HOME/.bun"

# GPG signing
export GPG_TTY=$(tty)

# Local TLS dev material (paths only; files live outside the repo)
export TLS_KEY_PATH="$HOME/excl/ssl/localdevKey.pem"
export TLS_CERT_PATH="$HOME/excl/ssl/localdevCert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/excl/ssl/cacerts.pem"

# PATH — single source of truth.
# `typeset -U path` keeps the array deduplicated as entries get prepended/appended.
typeset -U path
path=(
  $HOME/bin
  $DOTFILES/bin
  $HOME/.node/bin
  $VOLTA_HOME/bin
  $BUN_INSTALL/bin
  /opt/homebrew/opt/postgresql@17/bin
  /opt/homebrew/opt/python@3.10/bin
  /opt/homebrew/opt/sphinx-doc/bin
  $path
  $HOME/.local/bin
)
export PATH
