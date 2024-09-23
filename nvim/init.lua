if vim.loader then
	vim.loader.enable()
end
vim.opt.mouse = "a"
_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd
vim.opt.clipboard = "unnamedplus"

require("config.lazy")
