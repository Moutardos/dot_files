require("config.options")
-- Lazy stuff
require("config.lazy")
require("mini.surround").setup()
require("config.lsp-keymap")
-- Colorscheme
vim.cmd.colorscheme("cyberdream")
vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
