function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\e[0;37m\e[46m\u@\h \w\[\e[m \e[0;36m\$(parse_git_branch)\e[m\n\$"
export HISTCONTROL=ignoreboth
export HISTSIZE=50000
set completion-ignore-case on

export PATH=$HOME/.rbenv/bin:$PATH

# Aliases
alias ll='ls -la'
alias gis='git status'
alias gil='git log --graph --oneline --decorate --all'
alias giff='git diff'
alias gicm='git commit -m'

alias emacs="/usr/local/Cellar/emacs/24.2/Emacs.app/Contents/MacOS/Emacs -nw"

# ENV
export GREP_OPTIONS='--color=auto'
export EDITOR=/usr/local/bin/emacs

# rbenv
eval "$(rbenv init -)"
