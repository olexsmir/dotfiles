return function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local function buf_map(...)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ...)
  end

  local opts = { noremap = true, silent = true }
  buf_map("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_map("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_map("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_map("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_map("gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_map("<leader>la", "<cmd>Telescope lsp_code_actions<CR>", opts)
  buf_map("<leader>lA", "lua vim.lsp.buf.range_code_action()<CR>", opts)
  buf_map("<leader>ld", "<cmd>TroubleToggle<cr>", opts)
  buf_map("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_map("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_map("<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  buf_map("<leader>li", "<cmd>LspInfo<CR>", opts)
  buf_map("<leader>lR", "<cmd>LspRestart<CR>", opts)
end
