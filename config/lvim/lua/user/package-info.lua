local M = {}

M.setup = function()
  require("package-info").setup {
    {
      autostart = true,
      colors = {
        up_to_date = "#3C4048",
        outdated = "#6ec0fa",
      },
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
        },
      },
    },
  }
end

return M
