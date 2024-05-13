return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local ts_themes = require("telescope.themes")

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")

		local telescope_last = 0
		function ResumeTelescope()
			if telescope_last == 0 then
				telescope_last = 1
				builtin.live_grep()
			else
				builtin.resume()
			end
		end

		vim.keymap.set("n", "<leader>l", ResumeTelescope)
		vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
		vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(ts_themes.get_dropdown {
				previewer = false,
			})
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

		vim.keymap.set("n", "<leader>sw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end,
			{ desc = "[S]earch current [W]ord" }
		)
		vim.keymap.set("n", "<leader>sW", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end,
			{ desc = "[S]earch whole current [W]ord" }
		)
		vim.keymap.set("n", "<leader>s/", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end, { desc = "[/] Grep project for a string" })

		telescope.setup({
			defaults = require('telescope.themes').get_ivy {
				file_ignore_patterns = { "node_modules", "static" },
			},
		})
	end
}
