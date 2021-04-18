export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export EDITOR="nvim"

### StartShip
eval "$(starship init zsh)"

### Oh my zsh
export OMH="$HOME/.oh-my-zsh"
#ZSH_THEME="simple"
DISABLE_AUTO_TITLE="true"
plugins=(npm)
source $OMH/oh-my-zsh.sh

### Aliases
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias vim="nvim"
alias vi="vim"
alias tmux="tmux -2"
alias :q="exit"
alias ...="cd ../.."
