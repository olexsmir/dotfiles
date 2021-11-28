function _G.term_cmd(cmd)
  require("toggleterm.terminal").Terminal:new({ cmd = cmd, hidden = true }):toggle()
end

function _G.mkdir()
  local dir = vim.fn.expand "%:p:h"
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end
