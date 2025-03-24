require("config.options")

-- Lazy stuff
require("config.lazy")
-- Colorscheme
vim.cmd.colorscheme("cyberdream")
vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
