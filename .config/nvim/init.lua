require("config.options")
-- Lazy stuff
require("config.lazy")
require("config.lsp-keymap")
require("config.snacks-key")
-- Colorscheme
vim.cmd.colorscheme("cyberdream")
vim.keymap.set("n", "<leader>tt", "<cmd>CyberdreamToggleMode<CR>", { silent = true, desc = "Toggle light/dark theme" })
