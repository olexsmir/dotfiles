export PATH="$HOME/.yarn/bin:$HOME/bin:$HOME/.application:$PATH"

### Oh my zsh ###
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"              # Set theme.
#CASE_SENSITIVE="true"          # Use case-sensitive completion.
#HYPHEN_INSENSITIVE="true"      # Case-sensitive completion must be off.
#DISABLE_AUTO_UPDATE="true"     # Disable bi-weekly auto-update checks.
DISABLE_UPDATE_PROMPT="true"    # Automatically update without prompting.
#DISABLE_MAGIC_FUNCTIONS="true" # If pasting URL and other text is messed up.
#DISABLE_LS_COLORS="true"       # Disable colors in ls.
DISABLE_AUTO_TITLE="true"       # Disable auto-setting terminal title.
#ENABLE_CORRECTION="true"       # Enable command auto-correction.
#COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
export UPDATE_ZSH_DAYS=7        # Change how often to auto-update.

plugins=(yarn)
source $ZSH/oh-my-zsh.sh

### Variables
export EDITOR="nvim"
export VISUAL="nvim"

### Functions
bgcolor() {
    convert -size 1x1 xc:"$1" /tmp/bgc.png
    feh --bg-tile /tmp/bgc.png}
backup() {
    cp $1 $1.bak}

### Aliases
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias du="du -sh"
alias df="df -h"
alias vim="nvim"
alias vi="vim"
alias tmux="tmux -2"
alias :q="exit"
alias ..="cd .."
alias ...="cd ../.."
