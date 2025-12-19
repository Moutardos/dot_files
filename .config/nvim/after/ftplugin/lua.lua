vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0, -- current buffer only (Lua file)
  callback = function()
    vim.lsp.buf.format({
      async = false,
    })
  end,
})

