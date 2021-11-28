local on_attach = require "lsp.attach"
local M = {}

function M.setup()
  require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = { on_attach = on_attach }

    local ok, server_opts = pcall(require, "lsp.providers." .. server.name)
    if ok then
      opts = vim.tbl_deep_extend("force", opts, server_opts or {})
    end

    server:setup(opts)

    vim.cmd [[ do User LspAttachBuffers ]]

    require("lsp.null").setup()
    require("lspconfig")["null-ls"].setup {}
  end)
end

return M
