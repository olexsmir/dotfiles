--- "lvim" configuration
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "right"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.auto_open = 0
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.treesitter.ensure_installed = { "javascript", "jsdoc", "lua", "python" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.disable = { "python" }

--- keymappings
lvim.leader = "space"
lvim.keys.normal_mode = {
	{ "<C-s>", "<cmd>w<cr>" },
	{ "<C-w>", "<cmd>BufferClose<cr>" },
	-- Navigate split
	{ "<C-h>", "<cmd>wincmd h<cr>" },
	{ "<C-j>", "<cmd>wincmd j<cr>" },
	{ "<C-k>", "<cmd>wincmd k<cr>" },
	{ "<C-l>", "<cmd>wincmd l<cr>" },
	-- Resize split
	{ "<A-h>", "<cmd>vert res +2<cr>" },
	{ "<A-j>", "<cmd>res -2<cr>" },
	{ "<A-k>", "<cmd>res +2<cr>" },
	{ "<A-l>", "<cmd>vert res -2<cr>" },
	-- Resize
	{ "<A-1>", "<cmd>BufferGoto 1<cr>" },
	{ "<A-2>", "<cmd>BufferGoto 2<cr>" },
	{ "<A-3>", "<cmd>BufferGoto 3<cr>" },
	{ "<A-4>", "<cmd>BufferGoto 4<cr>" },
	{ "<A-5>", "<cmd>BufferGoto 5<cr>" },
	{ "<A-6>", "<cmd>BufferGoto 6<cr>" },
	{ "<A-7>", "<cmd>BufferGoto 7<cr>" },
	{ "<A-8>", "<cmd>BufferGoto 8<cr>" },
	{ "<A-9>", "<cmd>BufferGoto 9<cr>" },
}

--- Plugins
lvim.plugins = {
}

--- LSP
lvim.lang.javascript.lsp.setup.handlers = {
	["textDocument/publishDiagnostics"] = function(_, _, p, client_id, _, config)
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
		vim.lsp.diagnostic.on_publish_diagnostics(_, _, p, client_id, _, config)
	end,
}
