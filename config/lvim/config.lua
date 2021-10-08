lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

-- Default fatures
lvim.builtin.terminal.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.dap.active = true

-- GitSigns
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts = { delay = 200 }

-- TreeSitter
lvim.builtin.treesitter.ensure_installed = { "javascript", "typescript", "jsdoc", "yaml", "toml", "lua", "go", "gomod" }
lvim.builtin.treesitter.indent.disable = { "python" }

-- Telescope
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules", "target", "env", ".bin" }

-- NvimTree
lvim.builtin.nvimtree.ignore = { ".git", "node_modules", ".bin", "env" }

-- LSP
-- lvim.lsp.override = {"gopls"}

-- Others
require "user.plugins"
require "user.keymaps"
