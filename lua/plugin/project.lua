local M = {}

function M.setup()
  require("project_nvim").setup {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", ".svn", "Makefile", "package.json", "go.mod" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
  }
end

return M
