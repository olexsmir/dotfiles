require'nvim-treesitter.configs'.setup {
  ensure_installed = {'javascript', 'typescript', 'python', 'go'};
  highlight = { enable = true };
  indent = { enable = true };
}
