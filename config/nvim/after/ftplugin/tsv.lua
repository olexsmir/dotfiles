vim.opt_local.spell = true
vim.opt_local.expandtab = false
vim.opt_local.softtabstop = 0

Config.map("x", "<localleader>b", "<Esc>`>a</b><Esc>`<i<b><Esc>", true)
Config.map("n", "<localleader>b", "viw<Esc>`>a</b><Esc>`<i<b><Esc>", true)
Config.map("n", "<localleader>a", "viw:'<'>!anpi<cr>", true)
Config.map("n", "<localleader>A", "viw:'<'>!anpi --all<cr>", true)
Config.map("x", "<localleader>a", ":'<'>!anpi<cr>", true)
Config.map("n", "<localleader>r", function() vim.ui.open("https://context.reverso.net/translation/english-ukrainian/".. vim.fn.expand "<cword>") end)

vim.b.minihipatterns_config = { highlighters = {
  bold = { pattern = "<b>.-</b>", group = "Underlined" },
  anpi = { pattern = "anpi%:.*", group = "Error" },
} }
