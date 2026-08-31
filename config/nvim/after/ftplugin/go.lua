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
Config.map("n", "<localleader>b", function()
  local file, line = vim.fn.expand "%:p", vim.fn.line "."
  vim.fn.sign_place(0, "Breakpoints", "Breakpoint", file, { lnum = line })
  vim.system { "zmx", "send", "dlv", ("break %s:%d\n"):format(file, line) }
end, true)
Config.map("n", "<localleader>B", function()
  vim.fn.sign_unplace "Breakpoints"
  vim.system { "zmx", "send", "dlv", "clearall\n" }
end, true)
