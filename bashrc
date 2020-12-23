source ~/.profile
#source ~/.env

# Prompt generator - ezprompt.net
export PS1="\[\e[36m\]\u\[\e[m\]@\[\e[32m\]\w\[\e[m\] \\$ "

### Variables ###
export EDITOR='nvim'
export VISUAL='nvim'

### Aliases ###
alias cls='clear'
alias ls='ls --color=auto'
alias sl="ls"
alias tmux="tmux -2"
alias mkdir="mkdir -p"
alias du="du -sh"
alias df="df -h"
alias cp="cp -r" 
alias :q="exit"

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

alias tofish="chsh -s /bin/fish && echo 'Now log out.'"
alias tozsh="chsh -s /bin/zsh && echo 'Now log out.'"
alias tobash="chsh -s /bin/bash && echo 'Now log out.'"
