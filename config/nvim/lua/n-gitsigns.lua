require'gitsigns'.setup {
  signs = {
    add          = {hl = 'GitSignsAdd',    text = '│'};
    change       = {hl = 'GitSignsChange', text = '│'};
    delete       = {hl = 'GitSignsDelete', text = '_'};
    topdelete    = {hl = 'GitSignsDelete', text = '‾'};
    changedelete = {hl = 'GitSignsChange', text = '~'};
  };
  watch_index = {
    interval = 1000
  };
  current_line_blame = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  use_decoration_api = true,
  use_internal_diff = true,
}
