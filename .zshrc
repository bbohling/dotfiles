# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable completions
autoload -Uz compinit && compinit



ZSH_DISABLE_COMPFIX="true"


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
  nvm
  macos
  vscode
  z
  zsh-syntax-highlighting
  zsh-osx-autoproxy
)

source $ZSH/oh-my-zsh.sh


#export PATH="/Users/bbohling/bin:$PATH"
