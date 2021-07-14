require"lspinstall".setup {}
require"lspconfig".gopls.setup {}
-- require"lspconfig".pyls.setup {}
-- require"lspconfig".rls.setup  {}
-- require"lspconfig".denols.setup {}
require"lspconfig".lua.setup{}
require"tsserver"
require"efm"

-- Theme
require"github-theme".setup {}

-- Compe
require'compe'.setup {
  enabled = true,
  autocomplete = true,
  source = {
    -- path = true,
    buffer = true,
    description = true,
    nvim_lsp = true
  }
}

-- LuaLine
require'lualine'.setup {options={
  theme = "github"
}}

-- GitSigns
require'gitsigns'.setup {
  signs = {
    add          = {hl = 'GitSignsAdd',    text = '│'};
    change       = {hl = 'GitSignsChange', text = '│'};
    delete       = {hl = 'GitSignsDelete', text = '_'};
    topdelete    = {hl = 'GitSignsDelete', text = '‾'};
    changedelete = {hl = 'GitSignsChange', text = '~'};
  };
  watch_index = {interval = 1000};
  current_line_blame = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  use_decoration_api = true,
  use_internal_diff = true,
}

-- NvimTree
vim.g.nvim_tree_side = "right"
vim.g.nvim_tree_ignore = {".git", ".cache", "node_modules", "__pycache__", "env"}
-- vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_width = 24


-- TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'javascript', 'typescript', 'jsdoc', 'python', 'go', 'bash'};
  highlight = {enable=true};
}
