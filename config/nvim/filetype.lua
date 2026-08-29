vim.filetype.add {
  extension = {
    lock = "yaml",
    gotmpl = "gotmpl",
    vil = "json",
  },
  filename = {
    [".stignore"] = "gitignore",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
    [".*Dockerfile.*"] = "dockerfile",
    [".*/hypr/.+%.conf"] = "hyprlang",
    [".*/kitty/.+%.conf"] = "kitty",
  },
}
