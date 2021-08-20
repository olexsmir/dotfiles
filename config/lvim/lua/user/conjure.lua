local M = {}

local g = vim.g

M.setup = function()
  vim.g.localleader = ","

  g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
end

return M
