return
{
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-nvim-lsp", -- source for cmp
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect, noinsert",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
		{ name = 'calc'}, -- source for math calculations
      }),
	  window = {
		  completion = cmp.config.window.bordered(),
		  documentation = cmp.config.window.bordered(),
	  },
	  formatting = {
		  fields = {'menu', 'abbr', 'kind'},
		  format = function(entry, item)
			  local menu_icon ={
				  nvim_lsp = 'λ',
				  vsnip = '⋗',
				  buffer = 'Ω',
				  path = '🖫',
			  }
			  item.menu = menu_icon[entry.source.name]
			  return item
		  end,
      }
	})
	end
}
