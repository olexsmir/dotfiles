export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"
export EDITOR="nvim"

### StartShip
eval "$(starship init zsh)"

### FzF
export FZF_DEFAULT_COMMAND="rg --files --ignore-vcs"

### Oh my zsh
export OMH="$HOME/.oh-my-zsh"
# ZSH_THEME="simple"
DISABLE_AUTO_TITLE="true"
plugins=(docker nvm npm)
source $OMH/oh-my-zsh.sh

### Aliases
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias vim="nvim"
alias vi="vim"
alias tmux="tmux -2"
alias e="$EDITOR"
alias :q="exit"
alias ...="cd ../.."
alias .3="cd ../../.."
alias gog="go get"
alias gor="go run"
alias gob="go build"
alias pacs="sudo pacman -S"
alias pacr="sudo pacman -R"
