-- https://github.com/y9san9/y9nika.nvim/tree/main/colors/y9nika.lua
vim.cmd.highlight "clear"
if vim.fn.exists "syntax_on" then vim.cmd.syntax "reset" end
vim.g.colors_name = "y9nika"
if vim.o.background == "dark" then
  require "kolir" {
    bg = "#0e1415",
    fg = "#dddddd",
    primary = "#71ade7",
    secondary = "#95cb82",
    muted = "#aaaaaa",
    marker = "#dfdf8e",
    danger = "#db6f6f",
  }
else
  require "kolir" {
    bg = "#f7f7f7",
    fg = "#222222",
    primary = "#325cc0",
    secondary = "#448c27",
    marker = "#aa3731",
    muted = "#666666",
    danger = "#b03b2c",
  }
end
