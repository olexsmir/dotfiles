---@return vim.lsp.Config
return {
  cmd = { "clerk", "lsp" },
  filetypes = { "ledger" },
  settings = {
    latin_to_cyrillic_completion = true,
  }
}
