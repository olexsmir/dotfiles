-- vim: ft=lua
stds.nvim = {
	globals = {
		vim = { fields = { "g" } },
		"lvim",
		"O",
	},
	read_globals = {
		-- vim = { fields = { "cmd", "api", "fn", "o" }}
		"jit",
		"os",
		"vim",
	},
}
std = "lua51+nvim"
self = false
cache = true
