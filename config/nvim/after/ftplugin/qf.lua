Config.map("n", "q", "<cmd>quit<cr>", true)
Config.map("n", "dd", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local qflist = vim.fn.getqflist()

  -- remove line from list
  table.remove(qflist, line)
  vim.fn.setqflist(qflist, 'r')

  -- restore cursor position
  local max_lines = vim.api.nvim_buf_line_count(0)
  vim.api.nvim_win_set_cursor(0, { math.min(line, max_lines), 0 })
end, true)
