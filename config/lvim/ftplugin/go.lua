lvim.lang.go.formatters = {
	{ exe = "gofumpt" },
	-- { exe = "gofmt" },
	-- { exe = "goimports" },
}

-- Debugger
require("dap-install").config("go_delve", {})
