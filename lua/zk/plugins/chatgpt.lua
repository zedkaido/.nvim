return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "/usr/local/bin/pass show openai.com/nvim-key",
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
	}
}
