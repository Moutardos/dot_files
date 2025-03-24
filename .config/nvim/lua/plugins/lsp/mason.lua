return
{
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "jay-babu/mason-null-ls.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
            "clangd",      -- C/C++ language server
            "lua_ls",   -- Lua language server (ensure the right one is used)
            },
        })
        local mason_null = require("mason-null-ls")
        mason_null.setup({
            ensure_installed = {
                "stylua",  -- Lua formatter
            },
        })
    end,
}
