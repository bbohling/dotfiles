# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable completions
autoload -Uz compinit && compinit

# nvm stuff
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


ZSH_THEME="theunraveler"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES


plugins=(
  brew
  git
  kubectl
  node
  npm
  macos
  vscode
  z
)

source $ZSH/oh-my-zsh.sh

#######
# Determine if Proxies are needed or not
#######

if timeout 0.3 nc -z proxy-dmz.intel.com 911 2>/dev/null ; then
  # launchctl setenv https_proxy http://proxy-dmz.intel.com:912
  # launchctl setenv http_proxy http://proxy-dmz.intel.com:912
  launchctl setenv HTTPS_PROXY http://proxy-dmz.intel.com:912
  launchctl setenv HTTP_PROXY http://proxy-dmz.intel.com:912
  export all_proxy="http://proxy-dmz.intel.com:912"
  export http_proxy="http://proxy-dmz.intel.com:912"
  export https_proxy="http://proxy-dmz.intel.com:912"
  # export HTTP_PROXY="http://proxy-dmz.intel.com:912"
  # export HTTPS_PROXY="http://proxy-dmz.intel.com:912"
  export socks_proxy="socks5://proxy-dmz.intel.com:1080"
  # export NODE_USE_ENV_PROXY=1
  
 export no_proxy="127.0.0.1,localhost,.internal,.local,git.ops.smartperimeter.io,gateway.smart-edge.dev,ui.smart-edge.dev,.irv-colo.smart-edge.net,.intel.com"
#  export NO_PROXY="127.0.0.1,localhost,.internal,.local,git.ops.smartperimeter.io,gateway.smart-edge.dev,ui.smart-edge.dev,.irv-colo.smart-edge.net,.intel.com"
  export proxy_status=proxy_yes
#  git config --global http.proxy http://proxy-dmz.intel.com:912
#  git config --global https.proxy http://proxy-dmz.intel.com:912

# Set prompt to Blue for on VPN
#  export PS1="\e[${Blueshell}m[\u@\h \W]\$ \e[m"
 echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 echo "!! Intel proxies detected !!"
 echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 else
 echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 echo "!! Intel proxies unset !!"
 echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 unset all_proxy
 unset http_proxy
 unset https_proxy
 unset socks_proxy
 unset HTTP_PROXY
 unset HTTPS_PROXY
 unset NO_PROXY
#  unset request_proxy
 unset no_proxy
 launchctl unsetenv https_proxy
 launchctl unsetenv http_proxy
#  launchctl unsetenv HTTPS_PROXY http://proxy-dmz.intel.com:912
#  launchctl unsetenv HTTP_PROXY http://proxy-dmz.intel.com:912
 export proxy_status=no_proxy
#  git config --global --unset http.proxy
#  git config --global --unset https.proxy

# Set prompt to cyan for off VPN
#  export PS1="\e[${Cyanshell}m[\u@\h \W]\$ \e[m"
fi

source /Users/bbohling/.docker/init-zsh.sh || true # Added by Docker Desktop

# bun completions (BUN_INSTALL set in .zshenv)
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # eval "$(oh-my-posh init zsh)"
  # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/json.omp.json)"
  eval "$(oh-my-posh init zsh --config ~/.mytheme.omp.json)"
fi
