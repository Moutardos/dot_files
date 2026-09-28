-- Vim stuff
vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.autoindent = true
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.textwidth = 0
vim.opt.shiftwidth = 4
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"

-- Fold, tree needed
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Diagnostics
vim.diagnostic.config({
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- open_float ne fait rien s'il n'y a pas de diagnostic sous le curseur
		vim.diagnostic.open_float({
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = true,
			prefix = " ",
			scope = "cursor",
		})
	end,
})
