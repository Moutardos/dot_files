return {
	"folke/trouble.nvim",
	opts = {}, -- utilise les réglages par défaut
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
