export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
#source ~/.env
source ~/.profile

### Oh my zsh ###
ZSH_THEME="cyan-simple"         # Set theme
#CASE_SENSITIVE="true"          # Use case-sensitive completion.
#HYPHEN_INSENSITIVE="true"      # Case-sensitive completion must be off.
#DISABLE_AUTO_UPDATE="true"     # Disable bi-weekly auto-update checks.
#DISABLE_UPDATE_PROMPT="true"   # Automatically update without prompting.
#DISABLE_MAGIC_FUNCTIONS="true" # If pasting URL and other text is messed up.
#DISABLE_LS_COLORS="true"       # Disable colors in ls.
DISABLE_AUTO_TITLE="true"       # Disable auto-setting terminal title.
#ENABLE_CORRECTION="true"       # Enable command auto-correction.
#COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
export UPDATE_ZSH_DAYS=7        # Change how often to auto-update.
export LANG=en_US.UTF-8         # Set locale

plugins=(pip python golang pass emacs sudo heroku git taskwarrior encode64)
source $ZSH/oh-my-zsh.sh


### Variables ###
export EDITOR="nvim"
export VISUAL="nvim"
export GOPATH="$HOME/.go"

### Function ###
function bgcolor {
    convert -size 1x1 xc:$1 /tmp/bgc.png
    feh --bg-tile /tmp/bgc.png
}

### Aliases ###
alias cls="clear"
alias mkdir="mkdir -p"
alias mkd="mkdir"
alias sl="ls"
alias cp="cp -r"
alias du="du -sh"
alias df="df -h"
alias lns="ln -s"
alias uln="unlink"
alias rf="rm -rf"

# Program
alias vim="nvim"
alias tmux="tmux -2"
alias ipython="ipython --no-banner"
alias icat="kitty +kitten icat"
alias ccat="sh -c cat"
alias cat="bat"
eval $(thefuck --alias)

# Exit
alias :q="exit"
alias :q!="exit"
alias q="exit"
alias :qw="exit"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

# Doom emacs
alias doomsync="$HOME/.emacs.d/bin/doom sync"
alias doomupgrade="$HOME/.emacs.d/bin/doom upgrade"
alias doomdoctor="$HOME/.emacs.d/bin/doom doctor"
alias doom="$HOME/.emacs.d/bin/doom"
