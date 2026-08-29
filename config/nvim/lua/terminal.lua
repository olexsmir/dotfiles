local M = {}

function M.attach(opts)
  opts = opts or {}
  local prev_buf = vim.api.nvim_get_current_buf()
  vim.cmd.terminal(opts.program)
  local term_buf = vim.api.nvim_get_current_buf()
  if opts.command ~= nil then
    vim.api.nvim_chan_send(vim.bo.channel, opts.command)
    vim.api.nvim_chan_send(vim.bo.channel, '\n')
  end
  if opts.hide == true then
    vim.api.nvim_set_current_buf(prev_buf)
  end
  return term_buf
end

return M
