lvim.lang.go.formatters = {
	{ exe = "gofmt" },
	{ exe = "goimports" },
}

-- Debugger
require("dap-install").config("go_delve", {})
