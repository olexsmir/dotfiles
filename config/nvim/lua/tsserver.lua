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
            vim.lsp.diagnostics.on_publish_diagnostics(_, _, params, client_id, _, config)
        end,
    },
})
