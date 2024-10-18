alias cls clear
alias cp "cp -r"
alias mkdir "mkdir -p"
alias py python
alias d docker
alias dcm "docker compose"

# kitty specific
if test $TERM = "xterm-kitty"
  alias ssh "kitty +kitten ssh"
  alias icat "kitty +kitten icat"
end

alias killbt "rfkill block bluetooth"
alias unkillbt "rfkill unblock bluetooth"

# exa
alias ls "exa -l"
alias la "ls -a"
alias ll ls

# vim
alias vim nvim
alias e vim

# git
alias g git
alias ga "git add"
alias gc "git cm"

# go
alias yaegi "rlwrap yaegi"
alias gor "go run"
alias gob "go build"
alias gog "go get"
alias gom "go mod"

# clojure
alias cljcider "clj -M:cider"
alias cljrun "clj -M:run"
alias cljtest "clj -M:test"

# rust
alias ca cargo
alias cabu "cargo build"
alias caru "cargo run"
alias cate "cargo test"

# navigations
alias ... "cd ../.."
alias .3 "cd ../../.."
