alias cls clear
alias cp "cp -r"
alias mkdir "mkdir -p"
alias free "free -h"
alias df "df -h"
alias du "du -h"
alias chmox "chmod +x"

alias vim nvim
alias e vim

alias f hledger
alias g git
alias d docker
alias dcm "docker compose"

alias ... "cd ../.."
alias .3 "cd ../../.."

alias killbt "rfkill block bluetooth"
alias unkillbt "rfkill unblock bluetooth"

if type -q eza
  alias ls "eza -l"
  alias la "ls -a"
  alias ll ls
end

if test $TERM = "xterm-kitty"
  alias ssh "kitty +kitten ssh"
  alias icat "kitty +kitten icat"
end
