-- syntax who?
vim.cmd("syntax on")

vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

vim.cmd [[
	autocmd FileType netrw nmap <buffer> <C-l> <cmd>TmuxNavigateRight<CR>
	autocmd FileType netrw nmap <buffer> <C-r> <Space>.
]]

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20"
vim.opt.cursorline = false

-- Disable underline for errors
-- vim.opt.errorformat = "%m"

vim.wo.signcolumn = "yes"
vim.wo.number = true
vim.opt.relativenumber = true
vim.o.mousemodel = false

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.wrap = false
vim.opt.linebreak = false

vim.opt.swapfile = false
vim.opt.writebackup = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.completeopt = "menu,menuone,noselect"

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
vim.opt.wildignore:append "**/node_modules/**"
vim.opt.wildignore:append "**/build/**"
vim.opt.wildoptions = "pum,tagfile"

vim.g.wiki_root = "~/zk/garden"
vim.g.wiki_link_transform_on_follow = false
vim.g.wiki_journal = {
	root = "~/zk/garden",
}

-- DICTIONARIES
-- vim.opt.dictionary = "~/.thesaurus/words.txt"
-- vim.opt.thesaurus = "~/.dictionary/words.txt"
