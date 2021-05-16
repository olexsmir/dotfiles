export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.n/bin:$HOME/.golang/bin:$HOME/go/bin:$PATH"
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
plugins=(docker npm)
source $OMH/oh-my-zsh.sh

### Aliases
source ~/.aliases.sh
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias vim="nvim"
alias vi="vim"
alias vimfzf='vim $(fzf)'
alias e="$EDITOR"
alias tmux="tmux -2"
alias :q="exit"
alias ...="cd ../.."
