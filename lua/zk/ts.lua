local builtin = require "telescope.builtin";
local actions = require "telescope.actions";
local action_state = require "telescope.actions.state";

local function files_dotfiles()
	builtin.find_files {
		prompt_title = "Dotfiles",
		cwd = "~/.dotfiles",
	}
end

local function files_config()
	builtin.git_files {
		prompt_title = "Find Files: ~/.config/nvim",
		cwd = "~/.config/nvim",
	}
end

local function files_garden()
	builtin.find_files({
		prompt_title = "Wiki files",
		cwd = "~/zk/garden",
		disable_devicons = true,
		find_command = { "rg", "--files", "--sort", "path" },
		file_ignore_patterns = {
			"%.stversions/",
			"%.git/",
		},
		path_display = function(_, path)
			local name = path:match "(.+)%.[^.]+$"
			return name or path
		end,
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace_if(function()
				return action_state.get_selected_entry() == nil
			end, function()
				actions.close(prompt_bufnr)

				local new_name = action_state.get_current_line()
				if new_name == nil or new_name == "" then
					return
				end

				vim.fn["wiki#page#open"](new_name)
			end)

			return true
		end,
	})
end

vim.keymap.set("n", "<leader>fd", function() files_dotfiles() end, { desc = "[F]ind [D]otfiles" })
vim.keymap.set("n", "<leader>fc", function() files_config() end, { desc = "[F]ind [C]onfig File" })
vim.keymap.set("n", "<leader>fg", function() files_garden() end, { desc = "[F]ind [G]arden File" })
