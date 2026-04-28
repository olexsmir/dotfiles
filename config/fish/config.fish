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
  set -gx MANPAGER "nvim +Man!"

  alias vim nvim
  alias e vim
  alias ee "nvim -S"
end

if status is-interactive
  zoxide init fish | source
  direnv hook fish | source

  function fish_user_key_bindings
    fish_vi_key_bindings
  end
end

alias cls clear
alias cp "cp -r"
alias rm "rm -i"
alias mkdir "mkdir -p"
alias free "free -h"
alias df "df -h"
alias du "du -h"
alias chmox "chmod +x"
alias ":q" exit

alias ... "cd ../.."
alias .3 "cd ../../.."

if type -q hledger; alias f hledger; end
if type -q jj; abbr --add j jj; end
if type -q tmux; alias t "tmux attach 2>/dev/null || tmux"; end

if type -q eza
  alias ls "eza -l"
  alias la "ls -a"
  alias ll ls
end

if test "$TERM" = "xterm-kitty"
  alias ssh "kitty +kitten ssh"
  alias icat "kitty +kitten icat"
end
