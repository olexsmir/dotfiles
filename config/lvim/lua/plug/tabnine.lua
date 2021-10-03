local M = {}

function M.setup()
  local ok, tabnine = pcall(require, "cmp_tabnine.config")
  if not ok then
    return
  end

  tabnine:setup {
    max_lines = 1000,
    max_num_results = 10,
    sort = true,
  }
end

return M
