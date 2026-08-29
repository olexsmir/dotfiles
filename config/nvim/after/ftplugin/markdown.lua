vim.opt_local.wrap = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

vim.b.minihipatterns_config = { highlighters = {
  next = { pattern = "%#n[ext]*", group = "MiniTestPass" },
  tags = { pattern = "^tags%:", group = "Boolean" },
  links = { pattern = "https?://[^%s]+", group = "Tag" },
} }

-- TASKS
local function find_archive_heading(lines)
  return vim
    .iter(ipairs(lines))
    :find(function(_, line) return line:match "^%s*# Archive" end)
end

local function can_be_completed(str) return str:match "^-%s*" ~= nil end
local function is_labled(str) return str:match "^%s*[%-*] .*`done:%d" ~= nil end
local function to_labled(str)
  local task_prefix = str:match "^(%s*%- %[[x ]%])"
  local prefix = task_prefix or str:match "^(%s*[%-*] )"
  if not prefix then return nil end
  local label = "`" .. os.date "done:%Y%m%d-%H%M" .. "`"
  if task_prefix then
    str = task_prefix .. " " .. label .. str:sub(#task_prefix + 1)
    str = str:gsub("^(%s*%- )%[%s*%]", "%1[x]") -- mark task as complete
  else
    str = prefix .. label .. " " .. str:sub(#prefix + 1)
  end
  str = str:gsub("%[%[(.-)%]%]", "[%1]") -- remove link within a task
  str = str:gsub(" %#n[ext]*", "") -- remove next tag
  str = str:gsub("%s+$", "") -- white space in the end
  return str
end

Config.map("n", "<localleader>t", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local line_idx = vim.api.nvim_win_get_cursor(0)[1]
  local line = lines[line_idx]
  if not can_be_completed(line) then
    vim.notify("Can't be complated", vim.log.levels.ERROR)
    return
  end

  if is_labled(line) then
    vim.notify("Already completed", vim.log.levels.ERROR)
    return
  end

  local archived_heading = find_archive_heading(lines)
  if archived_heading == nil then
    table.insert(lines, "")
    table.insert(lines, "# Archive")
    archived_heading = #lines
  end

  table.remove(lines, line_idx)
  table.insert(lines, archived_heading, to_labled(line))
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
  vim.cmd.update()
end, true)
