-- Summon a floating terminal with ALT+t
return {
	"voldikss/vim-floaterm",
	init = function()
		vim.g.floaterm_shell = "fish"
		vim.g.floaterm_width = 0.7
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_autoclose = 2
	end,
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>ft", "<cmd>FloatermNew --name=myfloat<CR>", { desc = "New floating terminal" })

		-- <Esc> hides the window only in floaterm terminals
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user-floaterm", { clear = true }),
			pattern = "floaterm",
			callback = function(args)
				keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", { buf = args.buf, silent = true })
			end,
		})
	end,
}
