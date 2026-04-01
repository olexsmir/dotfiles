alias cls clear
alias cp "cp -r"
alias rm "rm -i"
alias mkdir "mkdir -p"
alias free "free -h"
alias df "df -h"
alias du "du -h"
alias chmox "chmod +x"
alias ":q" exit

alias ... "cd ../.."
alias .3 "cd ../../.."

alias killbt "rfkill block bluetooth"
alias unkillbt "rfkill unblock bluetooth"

if type -q hledger; alias f hledger; end
if type -q jj; abbr --add j jj; end
if type -q tmux; alias t "tmux attach 2>/dev/null || tmux"; end

if type -q nvim
  alias vim nvim
  alias e vim
  alias ee "nvim -S"
end

if type -q eza
  alias ls "eza -l"
  alias la "ls -a"
  alias ll ls
end

if test "$TERM" = "xterm-kitty"
  alias ssh "kitty +kitten ssh"
  alias icat "kitty +kitten icat"
end
