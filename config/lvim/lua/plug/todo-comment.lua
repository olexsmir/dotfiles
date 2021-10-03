local M = {}

function M.setup()
  local ok, todo_comments = pcall(require, "todo-comments")
  if not ok then
    return
  end

  todo_comments.setup {}
end

return M
