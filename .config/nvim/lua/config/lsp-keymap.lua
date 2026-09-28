vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- Neovim already maps K (hover), grr (references), grn (rename),
		-- gra (code action), gri (implementation), grt (type definition)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, buf = args.buf, desc = "Go to definition" })

		-- Prefer LSP folding when the server supports it (no treesitter parser needed)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})
