# Interactive-shell environment.
# PATH and tool-runtime env vars live in .zshenv (loaded for every zsh).

# Shell history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# less should not clear the screen on quit
export MANPAGER="less -X"

# Node
export NODE_ENV=development

# Kubernetes
export KUBECONFIG=~/.kube/amr-compute-cluster:~/.kube/amr-fm-compute-cluster
export K9S_EDITOR='code -w'

# Google Cloud
export GOOGLE_CLOUD_PROJECT=employeeexperience-intel
