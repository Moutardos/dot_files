return
{
    	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true
		
		local nvimtreesitter = require("nvim-treesitter")

		nvimtreesitter.setup
		{
		}	
		end
}
