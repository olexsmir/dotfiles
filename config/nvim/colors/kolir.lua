vim.cmd.highlight "clear"
if vim.fn.exists "syntax_on" then vim.cmd.syntax "reset" end
vim.g.colors_name = "kolir"
if vim.o.background == "dark" then
  require "kolir" {
    fg = "#c0caf5",
    bg = "#1a1b26",
    primary = "#85a6eb",   -- declarations
    secondary = "#94c85a", -- vars/consts
    muted = "#9d7cd8",     -- keywords
    marker = "#d4a06a",    -- comments, search, warnings
    danger = "#db6f6f",    -- errors, deletions
  }
else
  require "kolir" {
    fg = "#774f38",
    bg = "#f7efdf",
    primary = "#308444",
    secondary = "#b95942",
    muted = "#308090",
    marker = "#878787",
    danger = "#f10000",
  }
end
