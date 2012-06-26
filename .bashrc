# export PS1="\[\033[0;32m\]\u@\h \w\n\$\[\033[0m\]"
# export HISTCONTROL=ignoreboth
# export HISTSIZE=50000
# set completion-ignore-case on


# export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# if [ -f /opt/local/etc/bash_completion ]; then
#     . /opt/local/etc/bash_completion
# fi

# # Aliases
# alias ll='ls -la'

# # Command Options
# export GREP_OPTIONS='--color=auto'


export PS1="\[\033[0;37m\033[46m\]\u@\h \w\[\033[0m\]\n\$"
export HISTCONTROL=ignoreboth
export HISTSIZE=50000
set completion-ignore-case on


export PATH=/opt/local/bin:/opt/local/sbin:$PATH

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Aliases
alias ll='ls -la'
alias gis='git status'
alias gil='git log'

# Command Options
export GREP_OPTIONS='--color=auto'


export EDITOR=/opt/local/bin/emacs
