local my_autocmds = vim.api.nvim_create_augroup("MyAutocmds", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = my_autocmds,
  command = "checktime",
  desc = "Check if buffers changed on disk",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = my_autocmds,
  callback = function(args)
    vim.cmd("%s/\\s\\+$//e")

    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    local has_formatter = false
    for _, client in ipairs(clients) do
      if client:supports_method("textDocument/formatting") then
        has_formatter = true
        break
      end
    end

    if has_formatter then
      vim.lsp.buf.format({ async = false, timeout_ms = 1000, bufnr = args.buf })
    end
  end,
  desc = "Trim whitespace and Format with LSP on save",
})
