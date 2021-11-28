local M = {}

M.opts = { noremap = true, silent = true }

function M._map(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts)
end

function M.map(mode, from, to)
  if type(mode) == "table" then
    for _, m in pairs(mode) do
      M._map(m, from, to, M.opts)
    end
  end

  M._map(mode, from, to, M.opts)
end

function M.nmap(from, to)
  M._map("n", from, to, M.opts)
end

function M.expr(mode, from, to)
  M._map(mode, from, to, { noremap = true, expr = true })
end

return M
