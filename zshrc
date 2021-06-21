## StartShip
#eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$PATH"
export EDITOR="nvim"

## FzF
export FZF_DEFAULT_COMMAND="fd -t f -t l -E node_modules -E env -E __pycache__"

## Oh my zsh
plugins=(dotenv)
ZSH_THEME="simple"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

## FNM
eval $(fnm env)

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p"
alias vim="nvim" vi="vim" e="$EDITOR"
alias ...="cd ../.." .3="cd ../../.." .4="cd ../../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install"
alias pac="sudo pacman" pacs="pac -S" pacr="pac -R" pacss="pac -Ss"
