[[ $- != *i* ]] && return
PS1='\e[36m\w\e[39m '

export EDITOR='nvim'
export VISUAL='emacsclient -c -a emacs'

alias cls='clear'
alias ls='ls --color=auto'
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
