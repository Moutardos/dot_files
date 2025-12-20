return
{
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = function()
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		local dashboard_conf = require("config.dashboard")
		return {
			bigfile = { enabled = true },
			dashboard = dashboard_conf,
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			-- picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			}
		end,
}
