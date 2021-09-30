local M = {}

M.setup = function()
	vim.g.maplocalleader = ","
	vim.g["conjure#mapping#doc_word"] = "K"

	-- Clojure
	vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
	vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

	-- Scheme
	vim.g["conjure#client#scheme#stdio#command"] = "chicken-csi -quiet -:c"
	vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "\n-#;%d-> "

	lvim.builtin.cmp.sources = {
		{ name = "nvim_lsp", max_item_count = 7 },
		{ name = "cmp_tabnine", max_item_count = 3 },
		{ name = "buffer", max_item_count = 3 },
		{ name = "path", max_item_count = 5 },
		{ name = "luasnip", max_item_count = 3 },
		{ name = "nvim_lua" },
		{ name = "conjure" },
	}

	lvim.builtin.cmp.formatting = {
		format = function(entry, vim_item)
			local cmp_kind = require("user.lsp_kind").cmp_kind
			vim_item.kind = cmp_kind(vim_item.kind)
			vim_item.menu = ({
				buffer = "(Buffer)",
				nvim_lsp = "(LSP)",
				luasnip = "(Snip)",
				spell = "(Spell)",
				path = "(Path)",
				conjure = "(Conjure)",
				cmp_tabnine = "(Tabnine)",
			})[entry.source.name]
			vim_item.dup = ({
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
			})[entry.source.name] or 0
			return vim_item
		end,
	}
end

return M
