local M = {}

function M.setup()
  local ok, tabnine_cfg = pcall(require, "cmp_tabnine.config")
  if not ok then
    return
  end

  tabnine_cfg:setup {
    max_lines = 1000,
    max_num_results = 10,
    sort = true,
  }
end

return M
