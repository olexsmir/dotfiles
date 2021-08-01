## StartShip
# eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$PATH"
export EDITOR="nvim"

## FzF
export FZF_DEFAULT_COMMAND="fd -t f -t l -E node_modules -E env -E __pycache__"

## Oh my zsh
plugins=(dotenv yarn pip)
ZSH_THEME="simple"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

## FNM
eval $(fnm env)

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p"
alias nvim="lvim" vim="nvim" vi="vim" e="$EDITOR" lv="lvim"
alias ...="cd ../.." .3="cd ../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install"

if [[ -f "/bin/exa" ]]; then
    alias ls="exa -l" la="ls -a"
fi
