return {
  settings = {
    schemaDownload = {
      enable = true,
    },
    schemas = {
      { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
      { url = "https://json.schemastore.org/tsconfig.json", fileMatch = { "tsconfig.json", "tsconfig.*.json" } },
      { url = "https://json.schemastore.org/lerna.json", fileMatch = { "lerna.json" } },
      { url = "https://json.schemastore.org/eslintrc.json", fileMatch = { ".eslintrc.json", ".eslintrc" } },
      { url = "https://json.schemastore.org/prettierrc", fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" } },
      { fileMatch = { ".golangci.toml", ".golangci.json" }, url = "https://json.schemastore.org/golangci-lint.json" },
      { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
    },
  },
}
