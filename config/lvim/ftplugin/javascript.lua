lvim.lang.javascript.formatters = {
	-- { exe = "eslint_d" },
	{ exe = "prettierd" },
}

lvim.lang.javascript.linters = {
	{ exe = "eslint_d" },
}

-- Debugger
require("dap-install").config("jsnode", {})

-- Lsp
lvim.lang.javascript.lsp.setup.handlers = {
	["textDocument/publishDiagnostics"] = function(_, _, p, id, _, cfg)
		if p.diagnostics ~= nil then
			local i = 1
			while i <= #p.diagnostics do
				if p.diagnostics[i].code == 80001 then
					table.remove(p.diagnostics, i)
				else
					i = i + 1
				end
			end
		end
		vim.lsp.diagnostic.on_publish_diagnostics(_, _, p, id, _, cfg)
	end,
}
