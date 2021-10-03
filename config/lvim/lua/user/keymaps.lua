lvim.keys.normal_mode["<C-w>"] = "<cmd>BufferClose<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.visual_mode["jk"] = "<esc>"

-- Which key
lvim.builtin.which_key.mappings.l.a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Actions" }
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.s.P = { "<cmd>Telescope projects<cr>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Test",
  t = { "<cmd>Ultest<cr>", "Run tests" },
  s = { "<cmd>UltestStop<cr>", "Stop tests" },
  c = { "<cmd>UltestClear<cr>", "Clear result" },
  n = { "<cmd>UltestNearest<cr>", "Run test" },
  o = { "<cmd>UltestOutput<cr>", "Show output" },
  j = { "<Plug>(ultest-next-fail)", "Next fail" },
  k = { "<Plug>(ultest-prev-fail)", "Prev fail" },
}

-- Beffers
local fmt = string.format
for i = 1, 9 do
  lvim.keys.normal_mode[fmt("<A-%d>", i)] = fmt("<cmd>BufferGoto %d<cr>", i)
end
