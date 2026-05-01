alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias f="open -a Finder ./"

# eza — modern ls. Group dirs first; show git status in long views.
alias ls='eza --group-directories-first'
alias ll='eza -l --group-directories-first --git'
alias la='eza -la --group-directories-first --git'
alias lt='eza --tree --level=2 --group-directories-first'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Kubernetes
alias k=kubectl
alias kjobs="kubectl get jobs --field-selector status.successful!=1"
alias kdeps="~/excl/shell/describe_deployments.sh"

# Per-repo git identity overrides. ~/.gitconfig has [includeIf] blocks that
# auto-apply work identity under ~/excl/ and personal under ~/excl/🥃/, but
# these aliases force it explicitly when a repo lives elsewhere.
alias setworkemail="git config user.email 'brandon.bohling@intel.com'"
alias setpersonalemail="git config user.email 'brandon@bohling.me'"
alias setworkgpg="git config user.signingkey '8249D337BA4ABB08'"
alias setpersonalgpg="git config user.signingkey '1A03FC211D0455B2'"

# count lines of code
alias js-cloc="cloc --exclude-dir=node_modules ."

# Directories
alias dotfiles="cd $DOTFILES"
alias work="cd $HOME/excl"

# GitHub Copilot for GitHub CLI
alias ghcp="gh copilot"
