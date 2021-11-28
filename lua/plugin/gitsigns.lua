local M = {}

function M.setup()
  require("gitsigns").setup {
    signs = {
      add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    keymaps = {
      noremap = true,
      ["n <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ["n <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ["n <leader>gR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ["n <leader>gl"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
      ["n <leader>gS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
      ["n <leader>gU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 300,
    },
    current_line_blame_formatter_opts = { relative_time = false },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = { enable = false },
  }
end

return M
