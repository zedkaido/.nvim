vim.cmd [[colorscheme zk-yang]]

require "zk.keymaps"
require "zk.options"

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ spec = "zk.plugins", change_detection = { notify = false } });

require "zk.commands"
require "zk.garden"
require "zk.statusline"
require "zk.ts"
require "zk.snippets"

vim.cmd "autocmd Filetype help wincmd L"
