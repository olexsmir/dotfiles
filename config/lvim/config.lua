--- "lvim" configuration
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "spacegray"

lvim.builtin.dap.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "right"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.telescope = {
  defaults = {
    layout_config = { prompt_position = "top" },
    file_ignore_patterns = { ".git", "node_modules", "env", "target" },
  },
}
lvim.builtin.treesitter = {
  ensure_installed = { "javascript", "typescript", "jsdoc", "python", "lua", "go" },
  highlight = { enable = true },
  intent = { disable = { "python" } },
}

--- Keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = "<cmd>write<cr>"
lvim.keys.normal_mode["<C-w>"] = "<cmd>BufferClose<cr>"
lvim.keys.normal_mode["<A-h>"] = "<cmd>vert res +2<cr>"
lvim.keys.normal_mode["<A-j>"] = "<cmd>res -2<cr>"
lvim.keys.normal_mode["<A-k>"] = "<cmd>res +2<cr>"
lvim.keys.normal_mode["<A-l>"] = "<cmd>vert res -2<cr>"

-- Beffer navigation
for i = 1, 9 do
  lvim.keys.normal_mode[string.format("<A-%d>", i)] = string.format("<cmd>BufferGoto %d<cr>", i)
end

lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Test",
  t = { "<cmd>Ultest<cr>", "Run test" },
  s = { "<cmd>UltestStop<cr>", "Stop test" },
  c = { "<cmd>UltestClear<cr>", "Clear test result" },
  n = { "<cmd>UltestNearest<cr>", "Run test order by cursor" },
  o = { "<cmd>UltestOutput<cr>", "Show output order by cursor" },
  j = { "<Plug>(ultest-next-fail)", "Next fail" },
  k = { "<Plug>(ultest-prev-fail)", "Prev fail" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

--- Plugins
lvim.plugins = {
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "folke/zen-mode.nvim", cmd = { "ZenMode" } },
  {
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = "<cmd>UpdateRemotePlugins",
  },
  {
    "vim-test/vim-test",
    cmd = { "TestFile", "TestLast", "TestSuite", "TestVisit", "TestMearest" },
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("user.spectre").setup()
    end,
  },
  -- { "phaazon/hop.nvim", event = "BufRead", config = function() require("user.hop").setup() end },
  {
    "vuki656/package-info.nvim",
    ft = "json",
    config = function()
      require("user.package-info").setup()
    end,
  },
}

--- LSP
lvim.lang.javascript.lsp.setup.handlers = {
  ["textDocument/publishDiagnostics"] = function(_, _, p, client_id, _, config)
    if p.diagnostics ~= nil then
      local i = 1
      while i <= #p.diagnostics do
        if p.diagnostics[i].code == 80001 then
          table.remove(p.diagnostics, i)
        else
          i = i + 1
        end
      end
    end
    vim.lsp.diagnostic.on_publish_diagnostics(_, _, p, client_id, _, config)
  end,
}
