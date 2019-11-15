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
alias gib='git branch --sort=-committerdate'
alias giff='git diff'
alias gicm='git commit -am'
alias stashes='git stash list'

function gil () {
    tput rmam
    git log $@ --graph --decorate --date=format:"%Y-%m-%d %a %H:%M:%S" \
    --format=format:"%C(auto)%h%Creset %s%w(80,8,8)%C(auto)%n%-D%Creset%n%C(dim white)%ad by %an%Creset%n"
    tput smam
}

function gill () {
    tput rmam
    git log $@ --graph --decorate --format=format:'%w(80,0,8)%C(auto)%h %s%n%-D%Creset'
    tput smam
}

function recordsimulator() {
  echo Select simulator:
  list=$(xcrun simctl list | grep Booted | nl -w 2)
  echo "$list"
  read num
  device=$(echo "$list" | awk -v num=$num '/Booted/{i++}i==num{print; exit}')
  regex="\(([^(^)]*)\)[[:space:]]?\(Booted\)[[:space:]]?$"
  if [[ $device =~ $regex ]]; then deviceid=${BASH_REMATCH[1]}; fi
  filepath="~/Desktop/Recorded $(date "+%F %H.%M.%S").mp4"
  sec=5
  while [ $sec -gt 0 ]; do
     echo -ne "📹 start in $sec seconds... \r"
     sleep 1
     : $((sec--))
  done
  echo -ne "🔴 Recording... Ctrl+C to Stop.         \r"
  xcrun simctl io $deviceid recordVideo "$filepath"
  echo -ne "                                     \r"
  echo -e "\nVideo saved to $filepath"
}

function giffen() {
  if [ -z "$1" ]; then echo '🙏 Usage: giffen <file path>'; return; fi
  echo -n 'size? (just press Enter: 320) : '
  read size
  if [ -z "$size" ]; then size=320; fi
  regex="(.+)\.(.+)$"
  if [[ $1 =~ $regex ]]; then filename=${BASH_REMATCH[1]}; fi
  ffmpeg -i "$1" -vf "fps=10,scale=$size:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "${filename}.gif"
}

# ENV
export GREP_OPTIONS='--color=auto'
export EDITOR='emacs'

# rbenv
eval "$(rbenv init -)"
