## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$PATH"
export EDITOR="nvim"

## Oh my zsh
plugins=(dotenv asdf)
ZSH_THEME="simple"
DISABLE_AUTO_TITLE="true"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

## Tools
eval $(fnm env)
eval "$(zoxide init zsh)"

## VIM mode
set -o vi
bindkey -e jk \\e
bindkey -M vicmd "j" up-line-or-beginning-search
bindkey -M vicmd "k" down-line-or-beginning-search

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p"
alias gor="go run" gob="go build" gog="go get"
alias ...="cd ../.." .3="cd ../../.."
alias vim="nvim" vi="vim" e="vim"

if [[ -f "/bin/exa" ]]; then
   alias ls="exa -l" ll="ls" la="ls -a"
fi
