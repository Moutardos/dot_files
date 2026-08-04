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
			},
			-- Équivalent de "editor.formatOnSave": true
			format_on_save = false,
		})

		-- Ton raccourci (remplace Alt+Shift+F par <leader>f)
		vim.keymap.set({ "n", "v" }, "<leader>fo", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format Document" })
	end,
}
