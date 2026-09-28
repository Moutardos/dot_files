-- Git diff, <leader>gh to toggle line, <leader>gH for whole repo
return {
	"sindrets/diffview.nvim",
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewFileHistory",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
	},
	keys = {
		{
			"<leader>gd",
			function()
				if require("diffview.lib").get_current_view() then
					vim.cmd.DiffviewClose()
				else
					vim.cmd.DiffviewOpen()
				end
			end,
			desc = "Git diff (toggle)",
		},
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Git history (current file)" },
		{ "<leader>gh", ":DiffviewFileHistory<CR>", mode = "x", desc = "Git history (selected lines)" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Git history (whole repo)" },
	},
}
