local telescope = require("telescope.builtin")

local telescope_last = 0
function ResumeTelescope()
	if telescope_last == 0 then
		telescope_last = 1
		telescope.live_grep()
	else
		telescope.resume()
	end
end

vim.keymap.set("n", "<leader>l", ResumeTelescope)
vim.keymap.set("n", "<leader>fp", telescope.find_files, {})
vim.keymap.set("n", "<leader><leader>", telescope.git_files, {})
vim.keymap.set("n", "<leader>/", function()
	telescope.grep_string({ search = vim.fn.input("Grep >") });
end)

require("telescope").setup {
	defaults = {
		file_ignore_patterns = { "node_modules" }
	}
}

