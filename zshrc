export PATH="$HOME/.yarn/bin:$HOME/bin:$HOME/.applications:$HOME/.local/bin:$HOME/go/bin:$PATH"
export EDITOR="nvim"

### Oh my zsh
export OMH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
DISABLE_AUTO_TITLE="true"
plugins=(yarn nvm)
source $OMH/oh-my-zsh.sh

### Aliases
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias du="du -h"
alias vim="nvim"
alias vi="vim"
alias rgf="rg --files|rg"
alias tmux="tmux -2"
alias :q="exit"
alias ...="cd ../.."
alias icat="kitty +kitten icat"
