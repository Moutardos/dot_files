-- Downloads language servers and tools into Neovim
return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"lua_ls",
			},
			automatic_enable = {
				exclude = {
					"rust_analyzer", -- started by rustaceanvim
					"stylua", -- used as a formatter through conform, not as an LSP
				},
			},
		})

		-- Non-LSP tools
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua", -- Lua formatter (conform); clang-format comes from the system (/usr/bin)
				"tree-sitter-cli", -- needed by nvim-treesitter to build parsers
			},
		})
	end,
}
