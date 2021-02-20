set -U fish_user_paths $HOME/bin $HOME/.yarn/bin $HOME/.applications $fish_user_paths
set fish_greeting

## Variables
set EDITOR "nvim"
set VISUAL "nvim"


## Key bindings
function fish_user_key_bindings
  fish_default_key_bindings
  # fish_vi_key_bindings
end


## Colors
set fish_color_normal brwhite
set fish_color_autosuggestion '#DDDDDD'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brwhite


## Functions
function backup --argument filename
  cp $filename $filename.bak
end

function targz-this-folder --argument filename
  tar -czf $filename.tar.gz .
end

function zip-this-folder --argument filename
  zip -r $filename.zip .
end

function set-wallpaper --argument filename
  feh --bg-scale $filename
end

function set-random-wallpaper
  feh --randomize --bg-scale ~/Pictures/wallp
end


## Plugins
fundle plugin 'matchai/spacefish'      # Prompt theme
fundle plugin 'justinmayer/virtualfish' # Python venv support
fundle plugin 'FabioAntunes/fish-nvm'  # NVM status
fundle plugin 'edc/bass'               # Required for fish-nvm
fundle plugin 'jorgebucaran/autopair.fish' # Brackets closer
fundle init


## Aliases
alias cls="clear"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias du="du -sh"
alias df="df -h"
alias neovim='nvim'
alias vim="nvim"
alias vi="vim"
alias tmux="tmux -2"
alias :q="exit"
alias q="exit"
alias ..="cd .."
alias ...="cd ../.."
