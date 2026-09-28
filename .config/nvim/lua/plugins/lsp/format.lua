-- Runs code formatters.
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Applique clang-format pour le C et le C++
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
			},
			-- Format on save for Lua only (C/C++ stay manual with <leader>fo)
			format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype ~= "lua" then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		-- remplace Alt+Shift+F par <leader>fo
		vim.keymap.set({ "n", "v" }, "<leader>fo", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format Document" })
	end,
}
