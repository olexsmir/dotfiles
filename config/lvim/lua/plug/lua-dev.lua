local M = {}

function M.setup()
  local ok, lua_dev = pcall(require, "lua-dev")
  if not ok then
    return
  end

  lua_dev.setup {}
end

return M
