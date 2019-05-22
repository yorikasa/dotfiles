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
alias gic='git checkout'
alias gib='git branch'
alias giff='git diff'
alias gicm='git commit -am'

function gil () {
    tput rmam
    git log $1 --graph --decorate --date=format:"%Y-%m-%d %a %H:%M:%S" \
    --format=format:"%C(auto)%h%Creset %s%w(80,8,8)%C(auto)%n%-D%Creset%n%C(dim white)%ad by %an%Creset%n"
    tput smam
}

function gill () {
    tput rmam
    git log --graph --decorate --format=format:'%w(80,0,8)%C(auto)%h %s%n%-D%Creset'
    tput smam
}

# ENV
export GREP_OPTIONS='--color=auto'
export EDITOR='emacs'

# rbenv
eval "$(rbenv init -)"
