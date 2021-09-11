local pack_path = vim.fn.stdpath("data") .. "/site/pack"
local fmt = string.format

local function ensure(user, repo)
	local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.api.nvim_command(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
		vim.api.nvim_command(fmt("packadd %s", repo))
	end
end

ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")

vim.g["aniseed#env"] = {
	module = "config.init",
	compile = true,
}
