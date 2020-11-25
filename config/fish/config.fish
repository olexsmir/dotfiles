#source ~/.env
set PATH $PATH ~/.local/bin
set fish_greeting

### VARIABLES ###
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="kitty"

### ALIASES ###
alias cls='clear'
alias :q='exit'

alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias tobash="chsh -s /bin/bash && echo 'Now log out.'"
alias tozsh="chsh -s /bin/zsh && echo 'Now log out.'"
alias tofish="chsh -s /bin/fish && echo 'Now log out.'"
