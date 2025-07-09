set -gx EDITOR nvim
set -gx VISUAL nvim

set -g GOPATH $HOME/go
set -g GOBIN $GOPATH/bin

set -g PATH $GOBIN $PATH
set -g PATH $HOME/bin $PATH
set -g PATH $HOME/.local/bin $PATH
set -g PATH $GOBIN $PATH
set -g PATH node_modules/.bin $PATH
set -g PATH .bin $PATH

if status is-interactive
  starship init fish | source
  zoxide init fish | source
  mise activate fish | source
  direnv hook fish | source

  function fish_greeting
    if type -q todo.sh
      todo.sh
    end
  end

  function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jk backward-char force-repaint
  end
end
