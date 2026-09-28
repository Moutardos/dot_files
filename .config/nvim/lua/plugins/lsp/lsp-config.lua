-- Ready-made settings for language servers
return {
	"neovim/nvim-lspconfig",
	lazy = false, -- only provides server configs; they must exist before any buffer gets a filetype
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Advertise nvim-cmp's completion capabilities to every server
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		vim.lsp.config("clangd", {
			-- Active clang-tidy en temps réel dans l'éditeur
			cmd = {
				"clangd",
				"--clang-tidy",
				"--background-index",
				"--fallback-style=llvm",
				"--log=error",
			},
			init_options = {
				fallbackFlags = { "-std=c++17" },
			},
		})
		-- Enable the LSP servers
		vim.lsp.enable({ "clangd", "lua_ls" })
		-- For rust, see rustaceanvim.lua
	end,
}
