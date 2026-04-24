alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias f="open -a Finder ./"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

alias k=kubectl
alias kjobs="kubectl get jobs --field-selector status.successful!=1"
alias kdeps="~/excl/shell/describe_deployments.sh"

# git
alias setworkemail="git config user.email 'brandon.bohling@intel.com'"
alias setpersonalemail="git config user.email 'brandon@bohling.me'"

# intel devtool
alias dt-encrypt="dt github encrypt-vault-secret --vault-name "Squirrels" --username bbohling"
alias dt-decrypt="dt github decrypt-vault-secret --vault-name "Squirrels" --username bbohling"

# count lines of code
alias js-cloc="cloc --exclude-dir=node_modules ."

# Directories
alias dotfiles="cd $DOTFILES"
alias work="cd $HOME/excl"

# GitHub Copilot for GitHub CLI
alias ghcp="gh copilot"

