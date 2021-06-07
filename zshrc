## StartShip
#eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$PATH"
export EDITOR="nvim"

## FZF
export FZF_DEFAULT_COMMAND="fd -t f -E node_modules"

## Oh my zsh
plugins=(dotenv)
ZSH_THEME="simple"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

## HotKets
bindkey -s "^o" "ranger\n"
bindkey -s "^g" "lazygit\n"

## FNM
eval $(fnm env)
eval $(fnm completions)

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p"
alias vim="nvim" vi="vim" e="$EDITOR"
alias ...="cd ../.." .3="cd ../../.." .4="cd ../../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install"
alias pac="sudo pacman" pacs="pac -S" pacr="pac -R" pacss="pac -Ss"
