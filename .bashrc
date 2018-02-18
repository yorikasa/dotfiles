export PS1="\e[39m\e[48;5;33m\u@\h \w\e[0m\n\$"
export HISTCONTROL=ignoreboth
export HISTSIZE=50000
set completion-ignore-case on

# Aliases
alias ll='ls -la'

# Git
alias gis='git status'
alias gil='git log --graph --oneline --decorate --all'
alias gic='git checkout'
alias giff='git diff'
alias gicm='git commit -m'

source ~/.git-completion.bash

# ENV
export GREP_OPTIONS='--color=auto'
export EDITOR='emacs'

# rbenv
eval "$(rbenv init -)"
