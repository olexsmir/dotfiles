local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_prefix = "Search > ",
    selection_caret = " ",
    entry_prefix = " ",
    file_ignore_patterns = {"node_modules", "env", ".cache"},
    mappings = {
      i = {["<esc>"] = actions.close}
    };
  };
}
