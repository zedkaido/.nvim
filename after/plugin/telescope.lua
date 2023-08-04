local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.git_files, {})
vim.keymap.set("n", "<leader>/", function()
	builtin.grep_string({ search = vim.fn.input("Grep >") });
end)

require("telescope").setup {
   defaults = {
      file_ignore_patterns = {"node_modules"}
   }
}
