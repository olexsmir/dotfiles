lvim.leader = "space"
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "onedarker"

-- Terminal
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true

-- GitSigns
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts = { delay = 200 }

-- TreeSitter
lvim.builtin.treesitter.ensure_installed = { "javascript", "typescript", "jsdoc", "lua", "java" }
lvim.builtin.treesitter.indent.disable = { "clojure", "java", "python" }

-- Telescope
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules", "env" }

-- Debugger
lvim.builtin.dap.active = true

-- Mappings
lvim.keys.normal_mode["<C-w>"] = "<cmd>BufferClose<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }

local fmt = string.format
for i = 1, 9 do
	lvim.keys.normal_mode[fmt("<A-%d>", i)] = fmt("<cmd>BufferGoto %d<cr>", i)
end

-- Plugins
lvim.plugins = {
	{ "tpope/vim-surround", keys = { "c", "y", "d" } },
	-- { "andymass/vim-matchup", keys = { "%" } },
	{ "tzachar/cmp-tabnine", run = "./install.sh", event = "InsertEnter" },
	{ "folke/trouble.nvim", cmd = { "TroubleToggle" } },
	{ "folke/todo-comments.nvim", event = "BufRead" },
	{ "theHamsta/nvim-dap-virtual-text", config = "require[[user.dap-virtual-text]].setup()" },
}
