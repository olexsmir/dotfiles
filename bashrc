[[ $- != *i* ]] && return
PS1='\e[36m\w\e[39m '

source ~/.profile

alias ls='ls --color=auto'
alias cls='clear'
alias ..='cd ..'
alias py='python3'
