local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "go", "gomod" },
    highlight = { enable = true },
    indent = { enable = true, disable = { "python", "yml" } },
    autotag = { enable = true },
    context_commentstring = { enable = true },
    rainbow = {
      enable = false,
      extended_mode = true,
      max_file_lines = 500,
    },
  }

  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
end

return M
