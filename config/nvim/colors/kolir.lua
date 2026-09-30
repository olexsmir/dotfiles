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
  require "kolir" { -- source: github.com/projekt0n/github-nvim-theme
    fg = "#1f2328",
    bg = "#f6f8fa",
    primary = "#0969da",
    secondary = "#116329",
    muted = "#8a3a30", -- keyword brick red
    marker = "#0550ae",
    danger = "#b03b2c", -- error terracotta
  }
end
