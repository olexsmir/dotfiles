---@return vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gosum", "gowork", "gotmpl" },
  root_markers = { "go.mod", "go.work" },
  on_attach = function(_, buf)
    Config.map("n", "<leader>lf", function()
      vim.lsp.buf.format()

      local params = vim.lsp.util.make_range_params(0, "utf-8")
      params.context = { only = { "source.organizeImports" } } ---@diagnostic disable-line: inject-field
      local result = vim.lsp.buf_request_sync(buf, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-8")
          end
        end
      end
    end, buf)
  end,
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      renameMovesSubpackages = true,
      directoryFilters = { "-.git", "-.jj", "-node_modules" },
      analyses = {
        unusedparams = true,
        unreachable = true,
        unusedwrite = true,
        nilness = true,
        shadow = true,
        S1008 = true, -- simplify returning boolean expression
        SA5000 = true, -- assignment to nil map
        SA5007 = true, -- infinite recursion call
        ST1019 = true, -- importing the same package multiple times
        SA1000 = true, -- invalid regular expression
        SA1020 = true, -- using an invalid host:port pair with a net.Listen-related function
        SA1023 = true, -- modifying the buffer in an io.Writer implementation
        SA9001 = true, -- defers in range loops may not run when you expect them to
        ST1013 = true, -- should use constants for HTTP error codes, not magic numbers
        ST1000 = false, -- Incorrect or missing package comment
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = false,
        constantValues = true,
        ignoredError = true,
        functionTypeParameters = false,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = true,
        regenerate_cgo = true,
        gc_details = true,
        test = false,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
    },
  },
}
