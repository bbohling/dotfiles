# Make vim the default editor
#export EDITOR="vim"
export EDITOR="/Applications/Visual Studio Code.app/Contents/MacOS/Electron"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# timestamps for bash history. www.debian-administration.org/users/rossen/weblog/1
# saved for later analysis
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# Set Node.js environment
export NODE_ENV=local

# Load up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# postgres
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"

# export JAVA_HOME=$(/usr/libexec/java_home)

# debug git
# export GIT_TRACING=2
# export GIT_CURL_VERBOSE=1

# for GPG
export GPG_TTY=$(tty)

# intel certs
export NODE_EXTRA_CA_CERTS=~/excl/ssl/cacerts.pem

# export ALL_PROXY=http://proxy-dmz.intel.com:912
export HTTP_PROXY=http://proxy-dmz.intel.com:912
export HTTPS_PROXY=http://proxy-dmz.intel.com:912
# unset ALL_PROXY
# unset HTTP_PROXY
# unset HTTPS_PROXY
export NO_PROXY=intel.com
