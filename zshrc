export ZSH="/home/sasha/.oh-my-zsh"
#export ZSH="/root/.oh-my-zsh"

#ZSH_THEME="bureau"
ZSH_THEME="cyan-simple"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Case-sensitive completion must be off. _ and - will be interchangeable.
#HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
#DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=24

# Uncomment the following line if pasting URLs and other text is messed up.
#DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(pip python sudo git tmux taskwarrior) 
source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="vim"

echo "$(tput bold)Welcome:$(tput sgr0) $(whoami)"
source ~/.env
source ~/.profile

alias cls='clear'
alias :q="exit"
alias py='python3'
