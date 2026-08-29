Config.add "lewis6991/gitsigns.nvim"

local function wrap(fn)
  return function() return require("gitsigns")[fn]() end
end

Config.map("n", "]g", wrap "next_hunk")
Config.map("n", "[g", wrap "prev_hunk")
Config.map("n", "<leader>gs", wrap "stage_hunk")
Config.map("n", "<leader>gS", wrap "undo_stage_hunk")
Config.map("n", "<leader>gr", wrap "reset_hunk")
Config.map("n", "<leader>gb", wrap "blame")

Config.later(function()
  require("gitsigns").setup {
    signs = {
      add = { text = "" },
      change = { text = "" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "" },
      untracked = { text = "" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text_pos = "eol",
      delay = 300,
    },
  }
end)
