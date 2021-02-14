export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.yarn/bin:$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"
source ~/.profile

### Oh my zsh ###
ZSH_THEME="nten"                # Set theme.
#CASE_SENSITIVE="true"          # Use case-sensitive completion.
#HYPHEN_INSENSITIVE="true"      # Case-sensitive completion must be off.
#DISABLE_AUTO_UPDATE="true"     # Disable bi-weekly auto-update checks.
DISABLE_UPDATE_PROMPT="true"    # Automatically update without prompting.
#DISABLE_MAGIC_FUNCTIONS="true" # If pasting URL and other text is messed up.
#DISABLE_LS_COLORS="true"       # Disable colors in ls.
DISABLE_AUTO_TITLE="true"       # Disable auto-setting terminal title.
#ENABLE_CORRECTION="true"       # Enable command auto-correction.
COMPLETION_WAITING_DOTS="true"  # Display red dots whilst waiting for completion.
export UPDATE_ZSH_DAYS=7        # Change how often to auto-update.
export LANG=en_US.UTF-8         # Set locale

plugins=(python pip node npm yarn pass sudo git)
source $ZSH/oh-my-zsh.sh

### Variables ###
export EDITOR="nvim"
export VISUAL="nvim"

### Aliases ###
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias du="du -sh"
alias df="df -h"

# Program
alias vim="nvim"
alias vi="nvim"
alias tmux="tmux -2"

# Exit
alias :q="exit"
alias q="exit"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
