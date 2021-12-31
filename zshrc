## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$PATH"
export EDITOR="nvim"

## Oh my zsh
plugins=(git dotenv yarn extract)
ZSH_THEME="simple"
DISABLE_AUTO_TITLE="true"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

## Tools
eval $(fnm env)
eval "$(zoxide init zsh)"

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p"
alias gor="go run" gob="go build" gog="go get"
alias ...="cd ../.." .3="cd ../../.."
alias v="nvim" vim="v" vi="vim"
alias asdfi=". /opt/asdf-vm/asdf.sh" sdki=". $HOME/.sdkman/bin/sdkman-init.sh"

if [[ -f "/bin/exa" ]]; then
   alias ls="exa -l" ll="ls" la="ls -a"
fi

