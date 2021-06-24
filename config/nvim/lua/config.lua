-- LSP servers
require'lspinstall'.setup {}
require'lspconfig'.gopls.setup {}  -- Go
require'lspconfig'.pyls.setup {}   -- Python
require'lspconfig'.lua.setup {}    -- Lua
require'tsserver'  -- JS/TS
require'efm'       -- Linter's

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
  theme = "codedark"
}}

-- GitSigns
require'plug.gitsigns'

-- NeoGit
require'neogit'.setup {}

-- NvimTree
require'plug.nvimtree'

-- TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'javascript', 'typescript', 'jsdoc', 'python', 'go'};
  highlight = {enable=true};
}

-- Colorizer
-- require'plug.colorizer'
