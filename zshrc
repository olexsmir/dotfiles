export ZSH="/home/sasha/.oh-my-zsh"
source ~/.env


### Oh my zsh ###
ZSH_THEME="cyan-simple"          # Set theme
#CASE_SENSITIVE="true"           # Use case-sensitive completion.
#HYPHEN_INSENSITIVE="true"       # Case-sensitive completion must be off.
#DISABLE_AUTO_UPDATE="true"      # Disable bi-weekly auto-update checks.
DISABLE_UPDATE_PROMPT="true"     # Automatically update without prompting.
export UPDATE_ZSH_DAYS=13        # Change how often to auto-update.
#DISABLE_MAGIC_FUNCTIONS="true"  # If pasting URLs and other text is messed up.
#DISABLE_LS_COLORS="true"        # Disable colors in ls.
#DISABLE_AUTO_TITLE="true"       # Disable auto-setting terminal title.
#ENABLE_CORRECTION="true"        # Enable command auto-correction.
#COMPLETION_WAITING_DOTS="true"  # Display red dots whilst waiting for completion.
export LANG=en_US.UTF-8          # Set locale

plugins=(pip python sudo git taskwarrior)
source $ZSH/oh-my-zsh.sh

### Aliases ###
alias cls="clear"
alias :q

alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

alias tozsh="chsh -s /bin/zsh && echo 'Now log out.'"
alias tofish="chsh -s /bin/fish && echo 'Now log out.'"
alias tobash="chsh -s /bin/bash && echo 'Now log out.'"
