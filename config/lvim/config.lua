lvim.leader = "space"
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "onedarker"

-- Terminal
lvim.builtin.terminal.active = true

-- GitSigns
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts = { delay = 200 }

-- TreeSitter
lvim.builtin.treesitter.ensure_installed = { "javascript", "typescript", "jsdoc", "lua" }
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

local fmt = string.format
for i = 1, 9 do
	lvim.keys.normal_mode[fmt("<A-%d>", i)] = fmt("<cmd>BufferGoto %d<cr>", i)
end

-- Pluginos
lvim.plugins = {
	{ "tpope/vim-surround", keys = { "c", "y", "d" } },
	{ "andymass/vim-matchup", keys = { "%" } },
	{ "tzachar/cmp-tabnine", run = "./install.sh", event = "InsertEnter" },
	{ "folke/trouble.nvim", cmd = { "TroubleToggle" } },
	{ "folke/todo-comments.nvim", event = "BufRead" },
	{ "theHamsta/nvim-dap-virtual-text", config = "require[[user.dap-virtual-text]].setup()" },
	{
    "rcarriga/vim-ultest",
    config = "require[[user.ultest]].setup()",
    requires = { "vim-test/vim-test" },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = ":UpdateRemotePlugins",
	},
}
