require'lspconfig'.tsserver.setup {}
require'lspconfig'.gopls.setup {}
require'lspconfig'.pyls.setup {}

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
  };
}
