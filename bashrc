export VISUAL="vim"
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='\u@\h \W \$ '
stty -ixon

alias cls='clear'
alias sl='ls'
alias cd..='cd ..'
alias py='python3'
alias py3='python3'
