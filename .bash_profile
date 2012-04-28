export PS1="\[\033[0;32m\]\u@\h \w\n\$\[\033[0m\]"
export HISTCONTROL=ignoreboth
set completion-ignore-case on

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Aliases
alias ll='ls -la'
