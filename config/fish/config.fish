set -g EDITOR nvim
set -g VISUAL nvim

set -g GOPATH $HOME/go
set -g PATH $HOME/bin $PATH
set -g PATH $HOME/go/bin $PATH
set -g PATH $HOME/.local/bin $PATH
set -g PATH $HOME/.golang/bin $PATH
set -g PATH $HOME/.yarn/bin $PATH
set -g PATH $HOME/.cargo/bin $PATH
set -g PATH $HOME/.deno/bin $PATH
set -g PATH $HOME/.nix-profile/bin $PATH

set -g LOCALE_ARCHIVE /usr/lib/locale/locale-archive

set fish_greeting
if status is-interactive
    starship init fish | source
    zoxide init fish | source
    fnm env | source
end

function fish_user_key_bindings
  fish_vi_key_bindings

  bind -M insert -m default jk backward-char force-repaint
end
