set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin

set -gx PATH $GOBIN $PATH
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.bun/bin $PATH
set -gx PATH node_modules/.bin $PATH
set -gx NIX_PATH $HOME/.local/nix
set -gx LEDGER_FILE "$HOME/org/finance/2026.journal"

if type -q nvim
  set -gx EDITOR nvim
  set -gx VISUAL nvim
end

if status is-interactive
  starship init fish | source
  zoxide init fish | source
  mise activate fish | source
  direnv hook fish | source

  function fish_user_key_bindings
    fish_vi_key_bindings
  end
end
