[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\e[39m\e[48;5;33m\u@\h \w\e[0m$(__git_ps1 " %s")\n\$'
export HISTCONTROL=ignoreboth
export HISTSIZE=50000
set completion-ignore-case on

# Aliases
alias ll='ls -la'

# Git
alias gis='git status'
alias gil='git log --graph --oneline --decorate --all'
alias gic='git checkout'
alias gib='git branch'
alias giff='git diff'
alias gicm='git commit -am'

# ENV
export GREP_OPTIONS='--color=auto'
export EDITOR='emacs'

# rbenv
eval "$(rbenv init -)"