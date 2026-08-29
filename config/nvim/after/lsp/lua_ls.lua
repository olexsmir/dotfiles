---@return vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml" },
  settings = { Lua = {
    runtime = { version = "LuaJIT", path = { 'lua/?.lua', 'lua/?/init.lua' } },
    telemetry = { enable = false },
    semantic = { enable = false },
    format = { defaultConfig = {
      indent_size = 2,
      align_if_branch = "false",
      align_continuous_inline_comment = "false",
      align_continuous_assign_statement =  "false",
      align_continuous_rect_table_field = "false",
      align_table_field = "false",
      align_array_table = "false",
    } },
    diagnostics = {
      globals = { "vim", "Config" },
      disable = { "unused-function", "unused-label", "unused-vararg" },
      severity = {
        ["unused-local"] = "Warning",
      },
    },
    completion = {
      keywordSnippet = "Disable",
      callSnippet = "Disable",
    },
    hint = {
      enable = true,
      arrayIndex = "Disable",
      await = true,
      paramName = "Disable",
      paramType = false,
      semicolon = "Disable",
      setType = true,
    },
    workspace = {
      checkThirdParty = false,
      library = {
        vim.env.VIMRUNTIME,
        "${3rd}/luv/library",
        "$HOME/.local/share/nvim/site/pack/core"
      },
    },
  } },
}
