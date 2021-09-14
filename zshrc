## StartShip
# eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$HOME/.luarocks/bin:$PATH"
export EDITOR="lvim"

## FzF
export FZF_DEFAULT_COMMAND="fd -t f -t l -E node_modules -E env -E __pycache__ -E target"

## Oh my zsh
plugins=(git dotenv npm yarn extract)
ZSH_THEME="simple"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

## FNM
eval $(fnm env)

## Functions
dotnet() {
  $HOME/dotnet/dotnet "$@"
}

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p" open="open_command" lg="lazygit"
alias lv="lvim" vim="lvim"
alias ...="cd ../.." .3="cd ../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install" got="go test"

if [[ -f "/bin/exa" ]]; then
   alias ls="exa -l" ll="ls" la="ls -a"
fi
