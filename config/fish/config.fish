set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin

set -gx CARGO_HOME $HOME/.local/share/cargo
set -gx LEDGER_FILE "$HOME/org/finance/"(date +%Y)".journal"
set -gx NIX_PATH $HOME/.local/nix
set -gx OPAMROOT $HOME/.local/share/opam
set -gx RIPGREP_CONFIG_PATH $HOME/.config/rgrc
set -gx RUSTUP_HOME $HOME/.local/share/rustup

fish_add_path -g $GOBIN
fish_add_path -g $CARGO_HOME/bin
fish_add_path -g $HOME/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.bun/bin
fish_add_path -g ~/.local/share/mise/shims
fish_add_path -P node_modules/.bin

if type -q nvim
  set -gx EDITOR nvim
  set -gx VISUAL nvim
end

if status is-interactive
  zoxide init fish | source
  direnv hook fish | source

  function fish_user_key_bindings
    fish_vi_key_bindings
  end
end
