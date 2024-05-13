vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>:w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "<I> Delete previuos word" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line :m+1" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line :m-2" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line with line bellow" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to the next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to the previous search result and center" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace with paste above" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Pate from system clipboard" })
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete line (no clipboard)" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete selection (no clipboard)" })
vim.keymap.set("n", "<leader>D", "\"+D", { desc = "Delete selection to clipboard" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank line to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank selection to system clibpard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yant ot end of line to system clipboard" })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.keymap.set("n", "Q", "@qj")
vim.keymap.set("x", "Q", ":norm @q<CR>")

vim.keymap.set("n", "Z", "!!zsh<CR>", { desc = "BANG BANG -> :.!zsh" }) -- converts to :.!zsh
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open project inside tmux" })
vim.keymap.set("n", "<C-b>", "<cmd>silent !tmux neww tmux-switch-session<CR>", { desc = "Switch to tmux session" })
vim.keymap.set("n", "<leader>ff", function()
	vim.lsp.buf.format()
end, { desc = "[F]ormat [F]ile" })

vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Quickfix `cnext`" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Quickfix `cprev`" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Quickfix `lnext`" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Quickfix `lprev`" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>", { desc = "[S]earch and [R]eplace" })
vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "chmod +x %" })
vim.keymap.set("n", "<leader>xz", "<cmd>!chmod -x %<CR>", { silent = true, desc = "chmod -x %" })

vim.keymap.set("n", "<leader>gg", ":vert Git<CR>", { desc = "[G]it" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })

vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "[T]oggle [W]rapping" })
vim.keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_gb<CR>", { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>cgp", ":ChatGPT<CR>", { desc = "[C]hat[G]PT" })
vim.keymap.set("n", "<leader>cga", ":ChatGPTActAs<CR>", { desc = "[C]hat[G]PT [A]ct as..." })
vim.keymap.set("n", "<leader>cgc", ":ChatGPTCompleteCode<CR>", { desc = "[C]hat[G]PT [C]omplete Code" })
vim.keymap.set("n", "<leader>cge", ":ChatGPTEditWithInstructions<CR>", { desc = "[C]hat[G]PT [E]dit With Instructions" })
vim.keymap.set("n", "<leader>cgr", ":ChatGPTRun ", { desc = "[C]hat[G]PT [R]un" })
vim.keymap.set("v", "<leader>cgr", ":ChatGPTRun ", { desc = "[C]hat[G]PT [R]un" })

vim.keymap.set("i", "<C-l>", "<Esc>ysiW]wysiW]eeea<Space>", { desc = "`x` -> [[x]]", remap = true })
vim.keymap.set("n", "<leader>nl", "ysiW]wysiW]w", { desc = "`x` -> [[x]]", remap = true })
vim.keymap.set('v', '<leader>nl', "c[[<C-R>\"]]<Esc>", { desc = "[V] `x` -> [[x]]", noremap = true, silent = true })
vim.keymap.set("n", "<leader>nd", "ds]ds]", { desc = "[[x]] -> `x`", remap = true })

-- vim.keymap.set('n', '<CTRL-BS>', ':noh<CR>', { remap = true, silent = true })
