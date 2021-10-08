lvim.plugins = {
  { "tpope/vim-surround", keys = { "c", "y", "d" }, event = "BufRead" },
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("plug.dap").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("plug.todo-comment").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    event = "InsertEnter",
    config = function()
      require("plug.tabnine").setup()
    end,
  },
  {
    "folke/lua-dev.nvim",
    ft = "lua",
    config = function()
      require("plug.lua-dev").setup()
    end,
  },
  {
    "Smirnov-O/ts-unit.nvim",
    keys = { "vip", "cip", "yip", "dip" },
    config = function()
      require("plug.ts-unit").setup()
    end,
  },
  {
    "rcarriga/vim-ultest",
    requires = {
      { "vim-test/vim-test", after = "vim-ultest" },
    },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = ":UpdateRemotePlugins",
    config = function()
      require("plug.ultest").setup()
    end,
  },
}
