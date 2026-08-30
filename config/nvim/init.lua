vim.loader.enable()
require("vim._core.ui2").enable { enable = true }

vim.cmd.packadd "nvim.undotree"
vim.cmd.packadd "cfilter"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
for _, p in ipairs {
  "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "nvim_dir_plugin",
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin", "vimball", "vimballPlugin", "remote_plugins", "rrhelper",
  "tohtml", "2html_plugin",
  "logipat", "matchit",
} do vim.g["loaded_" .. p] = 1 end

-- i like my helpers -------------------------------------------------
Config = {}
Config.map = function(mode, from, to, buffer)
  vim.keymap.set(mode, from, to, { silent = true, buffer = buffer or false })
end

Config.add = function(opts)
  local spec = type(opts) == "string" and { src = opts } or opts
  spec.src = "https://github.com/" .. spec.src
  spec.version = spec.version or vim.version.range "*"
  spec.name = spec.name or nil
  vim.pack.add { spec }
end

local grp = vim.api.nvim_create_augroup("olexsmir", { clear = true })
Config.autocmd = function(ev, opts)
  vim.api.nvim_create_autocmd(ev, vim.tbl_extend("force", { group = grp }, opts))
end
Config.aucmd = function(ev, pattern, callback, once)
  Config.autocmd(ev, { pattern = pattern, callback = callback, once = once })
end

Config.later = vim.schedule
Config.onpack = function(pname, kinds, callback)
  if type(kinds) == "string" then kinds = { kinds } end
  Config.aucmd("PackChanged", "*", function(ev)
    if not (ev.data.spec.name == pname and vim.tbl_contains(kinds, ev.data.kind)) then return end
    if not ev.data.active then vim.cmd.packadd(pname) end
    callback()
  end)
end

-- settings ----------------------------------------------------------
Config.later(function() vim.o.clipboard = "unnamedplus" end)
Config.later(function()
  vim.diagnostic.config {
    virtual_text = { virt_text_pos = "eol", current_line = false },
    float = { source = "if_many" },
    signs = { text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    } },
  }
end)

vim.cmd.colorscheme "kolir"

vim.g.mapleader = " "
vim.g.maplocalleader = "-"

vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.o.exrc = true
vim.o.secure = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.infercase = true
vim.o.completeopt = "menuone,noselect,noinsert,fuzzy,popup"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 8
vim.o.scrolloff = 14
vim.o.sidescrolloff = 16
vim.o.smoothscroll = true
vim.o.signcolumn = "yes"
vim.o.title = true
vim.o.wrap = false
vim.o.foldenable = false

vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

vim.o.spell = false
vim.o.spelllang = "en_us,uk"

vim.o.laststatus = 0
vim.o.showmode = false
vim.o.ruler = true
vim.o.rulerformat = "%50(%=%{%v:lua.require'ruler'()%}%)"

vim.o.list = true
vim.opt.listchars:append {
  space = "·",
  trail = "~",
  tab = "│·",
}

--- keymaps ----------------------------------------------------------
vim.o.langmap = table.concat({
  "\'ʼ;`~", "№;#",
  "йЙ;qQ", "цЦ;wW", "уУ;eE", "кК;rR", "еЕ;tT", "нН;yY", "гГ;uU", "шШ;iI", "щЩ;oO", "зЗ;pP", "хХ;[{", "їЇ;]}", -- "ґҐ;\\|",
  "фФ;aA", "ыЫ;sS", "вВ;dD", "аА;fF", "пП;gG", "рР;hH", "оО;jJ", "лЛ;kK", "дД;lL", [[жЖ]], [[єЄ;'"]],
  "яЯ;zZ", "чЧ;xX", "сС;cC", "мМ;vV", "иИ;bB", "тТ;nN", "ьЬ;mM", [[бБ;\,<]], "юЮ;.>",
}, ',')

vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grx")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grt")

Config.map("i", "<c-r><c-d>", "<c-r>=strftime('%F')<cr>")

Config.map("t", "<esc><esc>", "<C-\\><C-n>")
Config.map("i", "jk", "<esc>")
Config.map("n", "gd", "<C-]>") -- tags ux
Config.map("n", "<C-d>", "<C-d>zz")
Config.map("n", "<C-u>", "<C-u>zz")
Config.map("n", "<leader>q", "<cmd>quit!<cr>")
Config.map("n", "<leader>w", "<cmd>update<cr>")
Config.map("n", "<leader>h", "<cmd>nohlsearch<cr>")
Config.map("n", "<leader>u", "<cmd>Undotree<cr>")
Config.map("n", "<leader>n", "<cmd>e ~/org/todo.md<cr>")
Config.map({ "n", "x" }, "<leader>z", "1z=")

Config.map("n", "<C-h>", "<cmd>wincmd h<cr>")
Config.map("n", "<C-j>", "<cmd>wincmd j<cr>")
Config.map("n", "<C-k>", "<cmd>wincmd k<cr>")
Config.map("n", "<C-l>", "<cmd>wincmd l<cr>")
Config.map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
Config.map("n", "<C-Down>", "<cmd>resize +2<cr>")
Config.map("n", "<C-Up>", "<cmd>resize -1<cr>")
Config.map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

Config.map("n", "<A-j>", ":move .+1<CR>==")
Config.map("n", "<A-k>", ":move .-2<CR>==")
Config.map("v", "<A-j>", ":move '>+1<CR>gv-gv")
Config.map("v", "<A-k>", ":move '<-2<CR>gv-gv")
Config.map("v", "<", "<gv")
Config.map("v", ">", ">gv")

Config.map("n", "<C-q>", function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 and win.loclist == 0 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end)

Config.map("n", "<C-n>", function() vim.cmd "silent! 1argument" end)
Config.map("n", "<C-m>", function() vim.cmd "silent! 2argument" end)
Config.map("n", "<C-,>", function() vim.cmd "silent! 3argument" end)
Config.map("n", "<C-.>", function() vim.cmd "silent! 4argument" end)
Config.map("n", "<leader>a", function()
  vim.cmd("argadd %")
  vim.cmd("argdedup")
end)

--- autocmds ---------------------------------------------------------
Config.aucmd("TextYankPost", nil, function() vim.hl.hl_op { higroup = "Visual" } end)

Config.aucmd("VimResized", nil, function()
  vim.cmd "tabdo wincmd ="
  vim.cmd("tabnext " .. vim.fn.tabpagenr())
end)

Config.aucmd("BufReadPost", "*", function() vim.fn.setpos(".", vim.fn.getpos "'\"") end)

Config.aucmd("TermOpen", "term://*", function()
  vim.cmd.startinsert()
  vim.keymap.set('n', '<leader>q', '<cmd>hide<CR>', { buffer = true })
end)
Config.aucmd("TermRequest", nil, function(ev)
  local pwd, n = string.gsub(ev.data.sequence, "\027]7;file://[^/]*", "")
  if n <= 0 then return end
  if vim.fn.isdirectory(pwd) == 0 then return end
  if vim.api.nvim_get_current_buf() ~= ev.buf then return end
  vim.cmd.cd(pwd)
end)

Config.autocmd("FileType", { pattern = { "help", "man" }, command = "wincmd L" })
Config.aucmd("FileType", "*", function()
  vim.opt_local.formatoptions:append("l") -- long lines not broken in insert mode
  vim.opt_local.formatoptions:append("1") -- don't break a line after a one-letter word

  vim.opt_local.formatoptions:remove("c") -- autowrap comments using textwidth with leader
  vim.opt_local.formatoptions:remove("r") -- don't auto-insert comment leader on enter in insert
  vim.opt_local.formatoptions:remove("o") -- don't auto-insert comment leader on o/O in normal
  vim.opt_local.formatoptions:remove("n") -- don't recognizes numbered lists
  vim.opt_local.formatoptions:remove("2") -- don't use the indent of second paragraph line
end)

--- lsp --------------------------------------------------------------
vim.lsp.enable { "clerk", "gleam", "gopls", "lua_ls", "ts_ls" }
Config.aucmd("LspAttach", nil, function(ev)
  local bufnr = ev.buf
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client then error "couldn't get an lsp server" end

  if client.name ~= "clerk" then client.server_capabilities.semanticTokensProvider = nil end
  if client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens) then
    vim.lsp.codelens.enable(true, { bufnr = bufnr })
  end

  Config.map("n", "gd", Snacks.picker.lsp_definitions, bufnr)
  Config.map("n", "gr", Snacks.picker.lsp_references, bufnr)
  Config.map("n", "gi", Snacks.picker.lsp_implementations, bufnr)
  Config.map("n", "gl", vim.diagnostic.open_float, bufnr)
  Config.map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, bufnr)
  Config.map("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, bufnr)
  Config.map("n", "<leader>ll", vim.lsp.codelens.run, bufnr)
  Config.map("n", "<leader>lr", vim.lsp.buf.rename, bufnr)
  Config.map("n", "<leader>lS", Snacks.picker.lsp_symbols, bufnr)
  Config.map("n", "<leader>ls", Snacks.picker.lsp_workspace_symbols, bufnr)
  Config.map("n", "<leader>li", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
    vim.print "Inlay hints toggled"
  end, bufnr)
end)

--- plugins ----------------------------------------------------------
Config.add { src = "tpope/vim-surround", version = "master" }
Config.add { src = "tpope/vim-speeddating", version = "master" }
Config.add { src = "tpope/vim-repeat", version = "master" }
Config.add "wakatime/vim-wakatime"

Config.add "j-hui/fidget.nvim"
Config.later(function()
  require("fidget").setup {
    progress = { display = {
      render_limit = 2,
      done_ttl = 2,
    } },
  }
end)

vim.cmd.packadd "viye"
Config.later(function()
  -- HACK: wait till https://github.com/neovim/neovim/pull/37727 gets merged
  -- ln -s ~/code/gopher.nvim ~/.local/share/nvim/site/pack/my-plugins/opt/gopher.nvim
  vim.cmd.packadd "gopher.nvim"

  vim.cmd.packadd "curl.nvim"

  vim.cmd.packadd "utest.nvim"
  require("utest").setup {}
  Config.map("n", "<leader>tn", require("utest").run)
  Config.map("n", "<leader>tt", require("utest").run_file)
  Config.map("n", "<leader>tc", require("utest").cancel)
  Config.map("n", "<leader>tr", require("utest").clear)
  Config.map("n", "<leader>tq", require("utest").qf)
end)

Config.add { src = "saghen/blink.cmp", version = vim.version.range "1.x" }
Config.later(function()
  require("blink.cmp").setup {
    keymap = {
      preset = "enter",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-l>"] = { "snippet_forward", "accept", "fallback" },
    },
    completion = { documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
    } },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  }

  vim.lsp.config("*", {
    flags = { debounce_text_changes = 150 },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })
end)

-- treesitter
Config.onpack("nvim-treesitter", "update", function() vim.cmd.TSUpdate() end)
Config.add { src = "nvim-treesitter/nvim-treesitter", version = "main" }
Config.add "nvim-treesitter/nvim-treesitter-context"

Config.later(function() require("treesitter-context").setup { max_lines = 3 } end)
Config.aucmd("FileType", "*", function(ev)
  if not ev.match or ev.match == "" or ev.match == "text" then vim.treesitter.stop() end
  pcall(vim.treesitter.start, ev.buf)
end)
