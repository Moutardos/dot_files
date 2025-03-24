return
{
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities()
		lspconfig["clangd"].setup({
			
		})
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
			  },
              completion = {
                callSnippet = "Replace",
				}
			}
		}
	  })
	end
}
