local M = {}

M.setup = function()
  require("spectre").setup {
    color_devicons = true,
    highlights = { ui = "String", search = "DiffChange", replace = "DiffDelete" },
    find_engine = {
      ["rg"] = {
        cmd = "rg",
        args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
        options = {
          ["ignore-case"] = { value = "--ignore-case", icon = "[I]", desc = "ignore case" },
          ["hidden"] = { value = "--hidden", desc = "hidden file", icon = "[H]" },
        },
      },
    },
  }
end

return M
