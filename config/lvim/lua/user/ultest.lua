local M = {}

M.setup = function()
  -- Go
  vim.g["test#go#gotest#options"] = "-v"
end

return M
