return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = function()
		local dashboard_conf = require("config.dashboard")
		return {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			dashboard = dashboard_conf,
			bigfile = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			picker = {
				enabled = true,
				layout = {
					preset = "vertical",
				},
				formatters = {
					file = {
						filename_first = true,
						truncate = 80,
					},
				},
				win = {
					input = {
						keys = {
							["<Esc>"] = "close",
						},
					},
				},
			},
		}
	end,
}
