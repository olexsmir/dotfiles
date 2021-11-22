## StartShip
# eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$HOME/.luarocks/bin:$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"

## Oh my zsh
plugins=(git dotenv npm yarn extract)
ZSH_THEME="simple"
DISABLE_AUTO_TITLE="true"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

## FNM
eval $(fnm env)

## Zoxide
eval "$(zoxide init zsh)"

## Functions
dotnet() {
  $HOME/dotnet/dotnet "$@"
}

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p" open="open_command" lg="lazygit"
alias v="nvim" vim="v" m="make"
alias ...="cd ../.." .3="cd ../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install" got="go test"
alias n="npm" asdfi=". /opt/asdf-vm/asdf.sh"

if [[ -f "/bin/exa" ]]; then
   alias ls="exa -l" ll="ls" la="ls -a"
fi
