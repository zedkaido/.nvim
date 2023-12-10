-- syntax who?
vim.cmd("syntax off")

vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

vim.cmd [[
	autocmd FileType netrw nmap <buffer> <C-l> <cmd>TmuxNavigateRight<CR>
	autocmd FileType netrw nmap <buffer> <C-r> <Space>.
]]

vim.opt.guicursor = ""
vim.opt.cursorline = false

vim.wo.signcolumn = "yes"
vim.wo.number = true
vim.opt.relativenumber = true
vim.o.mousemodel = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.writebackup = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.completeopt = "menuone,noselect"

vim.opt.colorcolumn = "80"
vim.cmd([[
	augroup AutoWrapMarkdown
	autocmd!
	autocmd FileType markdown
		\ setlocal textwidth=80 |
		\ setlocal tabstop=2 |
		\ setlocal shiftwidth=2 |
		\ setlocal softtabstop=2 |
		\ setlocal noexpandtab
	augroup END
]])

-- search down into folders
-- provides tab completion for all file-related tasks
vim.opt.path:append "**"
vim.opt.wildmenu = true
vim.opt.wildmode = "list:full" -- list:full | list:longest
vim.opt.wildignore:append "**/node_modules/**"

vim.g.wiki_root = "~/zk/garden"
vim.g.wiki_link_transform_on_follow = false
vim.g.wiki_journal = {
	root = "~/zk/garden",
}

vim.opt.dictionary = "~/.thesaurus/words.txt"
vim.opt.thesaurus = "~/.dictionary/words.txt"

-- required by vim-ai package
vim.g.python3_host_prog = "/usr/local/bin/python3"
