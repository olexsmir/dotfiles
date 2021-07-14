local root_pattern = require("lspconfig/util").root_pattern

require('lspconfig').typescript.setup({
  handlers = {
    ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
      if params.diagnostics ~= nil then
        local idx = 1
        while idx <= #params.diagnostics do
          if params.diagnostics[idx].code == 80001 then
            table.remove(params.diagnostics, idx)
          else
            idx = idx + 1
          end
        end
      end
      vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
    end,
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" };
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");
})
