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
end

return M
