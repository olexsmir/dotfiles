require("dap-install").config("jsnode_dbg", {})

lvim.lang.javascript.formatters = {
  { exe = "prettier" },
  -- { exe = "eslint" }
}
lvim.lang.javascript.linters = {
  { exe = "eslint" },
}
