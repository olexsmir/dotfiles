## Variables
set -g EDITOR nvim
set -g GOPATH $HOME/go
set -g PATH $HOME/bin $PATH
set -g PATH $HOME/go/bin $PATH
set -g PATH $HOME/.local/bin $PATH
set -g PATH $HOME/.golang/bin $PATH
set -g PATH $HOME/.yarn/bin $PATH
set -g PATH $HOME/.cargo/bin $PATH
set -g PATH $HOME/.nimble/bin $PATH

## Configure
set fish_greeting
if status is-interactive
    starship init fish | source
    zoxide init fish | source
    fnm env | source
end

function fish_user_key_bindings
  fish_vi_key_bindings

  bind -M insert -m default jk backward-char force-repaint
end


## Aliases
alias cls clear
alias cp "cp -r"
alias mkdir "mkdir -p"
alias d docker

## Editor
alias vim nvim
alias vi vim
alias v vi
alias e vi

## GO aliases
alias gor "go run"
alias gob "go build"
alias gog "go get"

## Navigations
alias ... "cd ../.."
alias .3 "cd ../../.."

## Exa
alias ls "exa -l"
alias ll ls
alias la "ls -a"
