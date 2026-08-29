vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

Config.map("n", "<localleader>x", function()
  vim.cmd.source "%"
  vim.print((vim.fn.expand "%:t") .. " reloaded")
end, true)
