---@return vim.lsp.Config
return {
  cmd = { "clerk", "lsp" },
  filetypes = { "ledger" },
  settings = {
    latinToCyrillicCompletion = true,
  }
}
