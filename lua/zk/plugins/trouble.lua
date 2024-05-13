return {
	"folke/trouble.nvim",
	opts = {
		icons = false,
		fold_open = "v",
		fold_closed = ">",
		indent_lines = false,
		signs = {
			error = "E",
			warning = "W",
			hint = "H",
			information = "I",
			other = "O"
		},
		use_diagnostic_signs = false
	},
	config = function(_, opts)
		require("trouble").setup(opts)
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>tn", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end)
		vim.keymap.set("n", "<leader>tp", function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end)
	end
}
