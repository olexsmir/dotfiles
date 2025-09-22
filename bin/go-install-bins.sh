#!/usr/bin/env bash
echo -e "\e[32m[gopls]\e[0m";        go install golang.org/x/tools/gopls@latest
echo -e "\e[32m[gofumpt]\e[0m";      go install mvdan.cc/gofumpt@latest
echo -e "\e[32m[goimports]\e[0m";    go install golang.org/x/tools/cmd/goimports@latest
echo -e "\e[32m[golines]\e[0m";      go install github.com/segmentio/golines@latest
echo -e "\e[32m[task]\e[0m";         go install github.com/go-task/task/v3/cmd/task@latest
echo -e "\e[32m[yaegi]\e[0m";        go install github.com/traefik/yaegi/cmd/yaegi@latest
echo -e "\e[32m[govulncheck]\e[0m";  go install golang.org/x/vuln/cmd/govulncheck@latest
echo -e "\e[32m[natscli]\e[0m";      go install github.com/nats-io/natscli/nats@latest
echo -e "\e[32m[dlv]\e[0m";          go install github.com/go-delve/delve/cmd/dlv@latest
echo -e "\e[32m[gotestsum]\e[0m";    go install gotest.tools/gotestsum@latest

echo -e "\e[32m[:GoInstallDepsSync<CR>]\e[0m"; nvim --headless +GoInstallDepsSync +q
