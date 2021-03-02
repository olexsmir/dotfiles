export PATH="$HOME/.yarn/bin:$HOME/bin:$HOME/.applications:$HOME/.local/bin:$PATH"

### Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
plugins=(yarn nvm)
source $ZSH/oh-my-zsh.sh

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
