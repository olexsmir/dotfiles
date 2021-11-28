local M = {}

function M.setup()
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        prompt_position = "top",
        horizontal = { mirror = false },
        vertical = { mirror = false },
      },
      file_ignore_patterns = { ".git", "node_modules", "__pycache__", "target", "env", ".bin" },
      path_display = { shorten = 5 },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      pickers = {
        find_files = { find_command = { "fd", "--type=file", "--hidden", "--smart-case" } },
        live_grep = { only_sort_text = true },
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-u>"] = false,

          ["<C-h>"] = "which_key",
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  }

  require("telescope").load_extension "projects"
end

return M
