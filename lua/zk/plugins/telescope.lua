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
	config = function ()
		local telescope = require("telescope")
		local telescope_builtin = require("telescope.builtin")
		local ts_themes = require("telescope.themes")

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")

		local telescope_last = 0
		function ResumeTelescope()
			if telescope_last == 0 then
				telescope_last = 1
				telescope_builtin.live_grep()
			else
				telescope_builtin.resume()
			end
		end

		vim.keymap.set("n", "<leader>l", ResumeTelescope)
		vim.keymap.set("n", "<leader>?", telescope_builtin.oldfiles, { desc = "[?] Find recently opened files" })
		vim.keymap.set("n", "<leader><space>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(ts_themes.get_dropdown {
				previewer = false,
			})
			end, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>s/", function()
			telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") });
			end, { desc = "[/] Grep project for a string" })

		vim.keymap.set("n", "<leader>gf", telescope_builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "static" },
				layout_config = {
					bottom_pane = {
						height = 25,
						preview_cutoff = 24,
						prompt_position = "top"
					},
					center = {
						height = 0.4,
						preview_cutoff = 24,
						prompt_position = "top",
						width = 0.5
					},
					cursor = {
						height = 0.9,
						preview_cutoff = 24,
						width = 0.8
					},
					horizontal = {
						height = 0.96,
						preview_cutoff = 24,
						prompt_position = "bottom",
						width = 0.96
					},
					vertical = {
						height = 0.96,
						preview_cutoff = 24,
						prompt_position = "bottom",
						width = 0.96
					}
				}
			}
		})
	end
}
