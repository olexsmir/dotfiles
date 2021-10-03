local M = {}

function M.setup()
  local ok, ts_unit = pcall(require, "ts-unit")
  if not ok then
    return
  end

  ts_unit.setup {
    keymaps = true,
  }
end

return M
