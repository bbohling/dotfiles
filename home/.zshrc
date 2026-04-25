# ~/.zshrc — interactive shell config.
# .zshenv handles PATH and tool-runtime env; this file is interactive-only.

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# ---- Options ----
setopt AUTO_CD                # `cd` by typing the dir name
setopt AUTO_PUSHD             # cd pushes onto the dirstack
setopt PUSHD_IGNORE_DUPS
setopt EXTENDED_GLOB          # **, ^, ~, etc.
setopt INTERACTIVE_COMMENTS   # allow # comments at the prompt

# ---- History ----
HISTFILE="$HOME/.zsh_history"
HISTSIZE=32768
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY       # save timestamps
setopt SHARE_HISTORY          # share history across sessions
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE      # don't record commands starting with space
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY            # verify history expansions before running

# ---- Completions ----
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

# Speed up compinit: full check at most once per day, fast otherwise.
autoload -Uz compinit
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# ---- Plugins (installed via brew) ----
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax-highlighting must be sourced LAST among interactive plugins
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Dotfiles modules ----
for f in "$DOTFILES"/aliases.zsh "$DOTFILES"/exports.zsh "$DOTFILES"/functions.zsh; do
  [ -f "$f" ] && source "$f"
done
[ -f "$DOTFILES/extra.zsh" ] && source "$DOTFILES/extra.zsh"

# Reload zsh in place. Replaces `omz reload`.
alias reload='exec zsh'

# ---- Intel proxy detection ----
if timeout 0.3 nc -z proxy-dmz.intel.com 911 2>/dev/null ; then
  launchctl setenv HTTPS_PROXY http://proxy-dmz.intel.com:912
  launchctl setenv HTTP_PROXY http://proxy-dmz.intel.com:912
  export http_proxy="http://proxy-dmz.intel.com:912"
  export https_proxy="http://proxy-dmz.intel.com:912"
  export all_proxy="http://proxy-dmz.intel.com:912"
  export socks_proxy="socks5://proxy-dmz.intel.com:1080"
  export no_proxy="127.0.0.1,localhost,.internal,.local,git.ops.smartperimeter.io,gateway.smart-edge.dev,ui.smart-edge.dev,.irv-colo.smart-edge.net,.intel.com"
  export proxy_status=proxy_yes
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo "!! Intel proxies detected !!"
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
else
  unset all_proxy http_proxy https_proxy socks_proxy HTTP_PROXY HTTPS_PROXY no_proxy NO_PROXY
  launchctl unsetenv https_proxy
  launchctl unsetenv http_proxy
  export proxy_status=no_proxy
  echo "~~~~~~~~~~~~~~~~~~~~~~~"
  echo "!! Intel proxies unset !!"
  echo "~~~~~~~~~~~~~~~~~~~~~~~"
fi

# ---- Tool integrations ----
[ -f "$HOME/.docker/init-zsh.sh" ] && source "$HOME/.docker/init-zsh.sh"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ---- Prompt ----
# Replaced by starship in P2.C; oh-my-posh kept as fallback during transition.
if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config ~/.mytheme.omp.json)" 2>/dev/null || true
fi
