local M = {}

function M.map(mode, key, cmd)
  vim.api.nvim_set_keymap(mode, key, cmd, { silent = true })
end

M.setup = function()
  require("hop").setup()

  M.map("n", "f", "<cmd>HopWord<cr>")
  M.map("n", "F", "<cmd>HopLine<cr>")
end

return M
