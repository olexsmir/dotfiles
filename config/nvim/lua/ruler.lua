---@param itms table<string>
local function join(itms)
  return vim.iter(itms)
    :filter(function(e) return e ~= "" end)
    :join " "
end

local function diagnostics()
  local counts = vim.diagnostic.count(vim.api.nvim_get_current_buf())
  local errors = counts[vim.diagnostic.severity.ERROR] or 0
  local warns = counts[vim.diagnostic.severity.WARN] or 0
  local infos = counts[vim.diagnostic.severity.INFO] or 0
  local hints = counts[vim.diagnostic.severity.HINT] or 0
  return join {
    errors > 0 and ("%#DiagnosticError#󰅚 " .. errors .. "%*") or "",
    warns > 0 and ("%#DiagnosticWarn#󰀪 " .. warns .. "%*") or "",
    infos > 0 and ("%#DiagnosticInfo#󰋽 " .. infos .. "%*") or "",
    hints > 0 and ("%#DiagnosticHint#󰌶 " .. hints .. "%*") or "",
  }
end

local function git_diff()
  local diff = vim.b.gitsigns_status_dict
  if diff == nil then return "" end
  return join {
    (diff.added ~= nil and diff.added > 0) and ("%#GitSignsAdd#+" .. diff.added .. "%*") or "",
    (diff.changed ~= nil and diff.changed > 0) and ("%#GitSignsChange#~" .. diff.changed .. "%*") or "",
    (diff.removed ~= nil and diff.removed > 0) and ("%#GitSignsDelete#-" .. diff.removed .. "%*") or "",
  }
end

return function()
  return join { git_diff(), diagnostics(), "%m", "%#TabLineSel# %l:%c %*" }
end
