vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

Config.map("n", "<localleader>f", "<cmd>GoIfErr<cr>", true)
Config.map("n", "<localleader>c", "<cmd>GoCmt<cr>", true)
Config.map("n", "<localleader>t", "<cmd>GoTestAdd<cr>", true)
Config.map("n", "<localleader>a", "<cmd>GoTestsAll<cr>", true)
Config.map("n", "<localleader>e", "<cmd>GoTestsExp<cr>", true)

-- DLV
vim.fn.sign_define("Breakpoint", { text = "b", texthl = "Error" })
local dlv = { pane_id = nil, signs = {} }
local function get_dlv_pane_id()
  if dlv.pane_id then return dlv.pane_id end
  local res = vim
    .system(
      { "tmux", "list-panes", "-s", "-F", "#{pane_id}:#{pane_current_command}" },
      { text = true }
    )
    :wait()
  if res.code ~= 0 then
    vim.notify("Failed to list tmux panes", vim.log.levels.ERROR)
    return
  end

  for line in res.stdout:gmatch "[^\n]+" do
    local pane_id, command = line:match "([^:]+):(.*)"
    if command and command:match "^dlv" then
      dlv.pane_id = pane_id
      return pane_id
    end
  end

  vim.notify("No dlv session found", vim.log.levels.ERROR)
end

Config.map("n", "<localleader>B", function()
  for _, sid in ipairs(dlv.signs) do
    vim.fn.sign_unplace("Breakpoints", { id = sid })
  end
  dlv.signs = {}
  dlv.tab_id = nil
  vim.system { "tmux", "send-keys", "-t", get_dlv_pane_id(), "clearall", "Enter" }
  vim.notify("Cleared all breakpoints.", vim.log.levels.INFO)
end, true)

Config.map("n", "<localleader>b", function()
  local line = vim.fn.line "."
  local cmd = string.format("break %s:%d", vim.fn.expand "%:p", line)
  vim.system { "tmux", "send-keys", "-t", get_dlv_pane_id(), cmd, "Enter" }

  local fullpath = vim.fn.expand "%:p"
  local sid = tonumber(string.format("%d%04d", vim.fn.bufnr(), line)) --[[ @as number]]
  vim.fn.sign_place(sid, "Breakpoints", "Breakpoint", fullpath, { lnum = line })
  table.insert(dlv.signs, sid)
end, true)
