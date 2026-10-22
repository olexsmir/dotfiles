---@return vim.lsp.Config
return {
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "ocaml.interface", "ocaml.menhir", "ocaml.ocamllex", "dune" },
  root_markers = { "dune-project", "dune-workspace", "*.opam" },
  settings = {
    inlayHints = {
      hintPatternVariables = true,
      hintLetBindings = true,
      hintFunctionParams = true,
    },
    extendedHover = { enable = true },
    syntaxDocumentation = { enable = true },
    merlinJumpCodeActions = { enable = true },
  },
}
