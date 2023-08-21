return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to Harpoon" })
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Harpoon" })
		vim.keymap.set("n", ",1", function() ui.nav_file(1) end)
		vim.keymap.set("n", ",2", function() ui.nav_file(2) end)
		vim.keymap.set("n", ",3", function() ui.nav_file(3) end)
		vim.keymap.set("n", ",4", function() ui.nav_file(4) end)
		vim.keymap.set("n", ",5", function() ui.nav_file(5) end)
		vim.keymap.set("n", ",6", function() ui.nav_file(6) end)
	end
}
