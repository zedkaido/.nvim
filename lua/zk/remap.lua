vim.g.mapleader = " "
vim.keymap.set("n", "<leader>.", vim.cmd.Ex)

-- <V> move up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

-- quick fix navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")
vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>xz", "<cmd>!chmod -x %<CR>", { silent = true })

local zk = require("zk.ts")
vim.keymap.set("n", "<leader>fd", function() zk.files_dotfiles() end)
vim.keymap.set("n", "<leader>fc", function() zk.files_config() end)
vim.keymap.set("n", "<leader>fr", function() zk.files_wiki() end)
vim.keymap.set("n", "<leader>fz", function() zk.files_zotero() end)

vim.keymap.set("n", "<leader>f/", ":CtrlSF ")

vim.keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_gb<CR>")
vim.keymap.set("n", "<leader>af", ":ChatGPT<CR>")
vim.keymap.set("n", "<leader>aa", ":ChatGPTActAs<CR>")
vim.keymap.set("n", "<leader>ac", ":ChatGPTCompleteCode<CR>")
vim.keymap.set("n", "<leader>ae", ":ChatGPTEditWithInstructions<CR>")
vim.keymap.set("n", "<leader>ar", ":ChatGPTRun ")
vim.keymap.set("v", "<leader>ar", "::ChatGPTRun ")
