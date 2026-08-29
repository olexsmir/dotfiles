Config.add "echasnovski/mini.nvim"

Config.map("n", "<leader>c", function() MiniBufremove.delete() end)
Config.map("n", "<leader>e", function()
  local path = vim.api.nvim_buf_get_name(0)
  if path == nil or vim.startswith(path, "term://") or vim.fn.filereadable(path) == 0 then path = vim.uv.cwd() or "" end
  MiniFiles.open(path, true)
  MiniFiles.reveal_cwd()
end)

require("mini.icons").setup {}
Config.later(function()
  require("mini.ai").setup {}
  require("mini.bufremove").setup { silent = true }
  require("mini.comment").setup {}
  require("mini.pairs").setup {}
  require("mini.splitjoin").setup {}

  local hi_words = require("mini.extra").gen_highlighter.words
  require("mini.hipatterns").setup {
    highlighters = {
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      fixme = hi_words({ "FIXME" }, "MiniHipatternsFixme"),
      todo = hi_words({ "TODO", "Todo" }, "MiniHipatternsTodo"),
      note = hi_words({ "NOTE" }, "MiniHipatternsNote"),
      hack = hi_words({ "HACK" }, "MiniHipatternsHack"),
    },
  }
end)

Config.aucmd("User", "MiniFilesBufferCreate", function(ev)
  vim.schedule(function()
    vim.api.nvim_set_option_value("buftype", "acwrite", { buf = 0 })
    vim.api.nvim_create_autocmd("BufWriteCmd", {
      callback = function() require("mini.files").synchronize() end,
      buffer = ev.data.buf_id,
    })
  end)
end)

require("mini.files").setup {
  content = {
    filter = function(f)
      return ({
        [".bin"] = {},
        [".docker"] = {},
        [".git"] = {},
        [".jj"] = {},
        [".tests"] = {},
        ["build"] = {},
        ["dist"] = {},
        ["elm-stuff"] = {},
        ["node_modules"] = {},
        ["target"] = {},
      })[f.name] == nil
    end,
  },
  mappings = {
    synchronize = "<cr>",
    go_in = "",
    go_in_plus = "l",
  },
}
