## StartShip
# eval "$(starship init zsh)"

## Variables
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.golang/bin:$GOPATH/bin:$HOME/.yarn/bin:$HOME/.luarocks/bin:$PATH"
export EDITOR="nvim"

## FzF
export FZF_DEFAULT_COMMAND="fd -t f -t l -E node_modules -E env -E __pycache__ -E target"

## Oh my zsh
plugins=(git dotenv npm yarn extract)
ZSH_THEME="simple"
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

## FNM
eval $(fnm env)

## Aliases
alias cls="clear" cp="cp -r" mkdir="mkdir -p" open="open_command" lg="lazygit"
alias nvim="lvim" vim="nvim" vi="vim" lv="lvim"
alias ...="cd ../.." .3="cd ../../.."
alias gor="go run" gob="go build" gog="go get" goi="go install"

if [[ -f "/bin/exa" ]]; then
   alias ls="exa -l" ll="ls" la="ls -a"
fi
