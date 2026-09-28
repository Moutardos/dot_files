-- Deprecated, stays here for old plugin compatibility
-- an / in to incr/decr scope selection
local ensure_installed = { "c", "cpp", "rust", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- this plugin does not support lazy-loading
		build = ":TSUpdate",
		dependencies = {
			"mason-org/mason.nvim", -- puts Mason's `tree-sitter` CLI on PATH before parsers are built
		},
		config = function()
			local ts = require("nvim-treesitter")
			ts.install(ensure_installed) -- no-op for parsers that are already installed

			local available -- languages nvim-treesitter can install, computed on first use
			local tried = {} -- only try to auto-install a missing parser once per session
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang or pcall(vim.treesitter.start, args.buf, lang) then
						return
					end
					-- Missing parser: install it, like the old `auto_install = true`
					available = available or ts.get_available()
					if tried[lang] or not vim.list_contains(available, lang) then
						return
					end
					tried[lang] = true
					ts.install(lang):await(vim.schedule_wrap(function()
						if vim.api.nvim_buf_is_valid(args.buf) then
							pcall(vim.treesitter.start, args.buf, lang)
						end
					end))
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					-- automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					-- 'v' charwise, 'V' linewise, '<c-v>' blockwise
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					-- also select the whitespace around the textobject, like the built-in `ap`
					include_surrounding_whitespace = true,
				},
			})

			local select = require("nvim-treesitter-textobjects.select")
			local textobjects = {
				af = { "@function.outer", "textobjects", "Around function" },
				["if"] = { "@function.inner", "textobjects", "Inside function" },
				ac = { "@class.outer", "textobjects", "Around class" },
				ic = { "@class.inner", "textobjects", "Inside class" },
				as = { "@local.scope", "locals", "Around language scope" },
			}
			for lhs, obj in pairs(textobjects) do
				vim.keymap.set({ "x", "o" }, lhs, function()
					select.select_textobject(obj[1], obj[2])
				end, { desc = obj[3] })
			end
		end,
	},
}
