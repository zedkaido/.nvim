-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   use 'wbthomason/packer.nvim' -- packer can manage itself
   use 'mbbill/undotree'
	use 'christoomey/vim-tmux-navigator'
	--use 'puremourning/vimspector' for debugging
	use 'skywind3000/asyncrun.vim'
   use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'theprimeagen/harpoon'
	use 'lervag/wiki.vim'
	use 'dyng/ctrlsf.vim'

   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { { 'nvim-lua/plenary.nvim' } },
   }

   use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' });
   use('nvim-treesitter/playground'); -- for debugging treessiter

   use {
     'VonHeikemen/lsp-zero.nvim',
     branch = 'v2.x',
     requires = {
       -- LSP Support
       {'neovim/nvim-lspconfig'},             -- Required
       {                                      -- Optional
         'williamboman/mason.nvim',
         run = function()
           pcall(vim.cmd, 'MasonUpdate')
         end,
       },
       {'williamboman/mason-lspconfig.nvim'}, -- Optional

       -- Autocompletion
       {'hrsh7th/nvim-cmp'},     -- Required
       {'hrsh7th/cmp-nvim-lsp'}, -- Required
       {'L3MON4D3/LuaSnip'},     -- Required
     }
   }

	use({
		'kylechui/nvim-surround',
		tag = '*', -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require('nvim-surround').setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})

	use({
		'jackMort/ChatGPT.nvim',
		config = function()
			require('chatgpt').setup({
				api_key_cmd = 'pass show openai.com/nvim-key',
			})
		end,
		requires = {
			'MunifTanjim/nui.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim'
		}
	})
end)
