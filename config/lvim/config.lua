lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "onedarker"

-- Default fatures
lvim.builtin.terminal.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.dap.active = true

-- GitSigns
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts = { delay = 200 }

-- TreeSitter
lvim.builtin.treesitter.ensure_installed = { "javascript", "typescript", "jsdoc", "lua", "go" }
lvim.builtin.treesitter.indent.disable = { "clojure", "java", "python" }
require("user.treesitter")

-- Telescope
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules", "env" }

-- Mappings
lvim.keys.normal_mode["<C-w>"] = "<cmd>BufferClose<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.builtin.which_key.mappings.l.a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Actions" }
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings["t"] = {
	name = "Test",
	t = { "<cmd>Ultest<cr>", "Run test" },
	s = { "<cmd>UltestStop<cr>", "Stop test" },
	c = { "<cmd>UltestClear<cr>", "Clear test result" },
	n = { "<cmd>UltestNearest<cr>", "Run test order by cursor" },
	o = { "<cmd>UltestOutput<cr>", "Show output order by cursor" },
	j = { "<Plug>(ultest-next-fail)", "Next fail" },
	k = { "<Plug>(ultest-prev-fail)", "Prev fail" },
}

for i = 1, 9 do
	lvim.keys.normal_mode[string.format("<A-%d>", i)] = string.format("<cmd>BufferGoto %d<cr>", i)
end

-- Pluginos
lvim.plugins = {
	{ "tpope/vim-surround", keys = { "c", "y", "d" } },
	{ "andymass/vim-matchup", keys = { "%" } },
	{ "tzachar/cmp-tabnine", run = "./install.sh", event = "InsertEnter" },
	{ "folke/trouble.nvim", cmd = { "TroubleToggle" } },
	{ "folke/todo-comments.nvim", event = "BufRead" },
	{ "theHamsta/nvim-dap-virtual-text", config = "require[[user.dap-virtual-text]].setup()" },
	{ "vim-test/vim-test", cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" } },
	{
		"rcarriga/vim-ultest",
		requires = { "vim-test/vim-test" },
		cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
		run = ":UpdateRemotePlugins",
	},
}
