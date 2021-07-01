-- Python
local flake8 = {
  lintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"}
}

-- Javascript
local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

-- GoLang
local golint = {
  lintCommand = "golint",
  lintIgnoreExitCode = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintSource = "golint"
}

-- Setup
require"lspconfig".efm.setup {
  init_options = {documentFormatting = false, codeAction = false},
  filetypes = {"python", "javascript", "typescript", "go"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = {flake8},
      javascript = {eslint},
      typescript = {eslint},
      go = {golint}
    };
  };
}
