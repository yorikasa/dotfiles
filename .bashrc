export PS1="\[\033[0;37m\033[46m\]\u@\h \w\[\033[0m\]\n\$"
export HISTCONTROL=ignoreboth
export HISTSIZE=50000
set completion-ignore-case on

export PATH=$HOME/.rbenv/bin:$PATH

# Aliases
alias ll='ls -la'
alias gis='git status'
alias gil='git log'
alias giff='git diff'

alias emacs="/usr/local/Cellar/emacs/24.1/Emacs.app/Contents/MacOS/Emacs -nw"

# ENV
export GREP_OPTIONS='--color=auto'
export EDITOR=/opt/local/bin/emacs

# rbenv
eval "$(rbenv init -)"
