return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		-- local capabilities = cmp_lsp.default_capabilities()
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set
			-- Hover and go to definition
			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "gd", vim.lsp.buf.definition, opts)
		end

		vim.lsp.config.lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		}
		-- Enable the LSP servers
		vim.lsp.enable("clangd")
		vim.lsp.enable("lua_ls")
		-- For rust, see rustaceanvim.lua
	end,
}
