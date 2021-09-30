## StartShip
# eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$HOME/.luarocks/bin:$HOME/.cargo/bin:$PATH"
export EDITOR="lvim"

## FzF
export FZF_DEFAULT_COMMAND="fd -t f -t l -E node_modules -E env -E __pycache__ -E target"

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
asdf() {
  . /opt/asdf-vm/asdf.sh
  asdf $@
}

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p" open="open_command" lg="lazygit"
alias lv="lvim" vim="lvim"
alias ...="cd ../.." .3="cd ../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install" got="go test"
alias n="npm"

if [[ -f "/bin/exa" ]]; then
   alias ls="exa -l" ll="ls" la="ls -a"
fi
