#!/usr/bin/env bash
echo -e "\e[32m[gopls]\e[0m";        go install golang.org/x/tools/gopls@latest
echo -e "\e[32m[dlv]\e[0m";          go install github.com/go-delve/delve/cmd/dlv@latest
echo -e "\e[32m[staticcheck]\e[0m";  go install honnef.co/go/tools/cmd/staticcheck@latest
echo -e "\e[32m[gofumpt]\e[0m";      go install mvdan.cc/gofumpt@latest
echo -e "\e[32m[goimports]\e[0m";    go install golang.org/x/tools/cmd/goimports@latest
echo -e "\e[32m[govulncheck]\e[0m";  go install golang.org/x/vuln/cmd/govulncheck@latest
