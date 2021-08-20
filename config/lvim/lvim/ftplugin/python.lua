require("dap-install").config("python_dbg", {})

lvim.lang.python.formatters = {
  { exe = "black" },
  { exe = "isort" },
}
lvim.lang.python.linters = {
  { exe = "flake8" },
}
