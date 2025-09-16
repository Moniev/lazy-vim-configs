local my_autocmds = vim.api.nvim_create_augroup("MyAutocmds", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = my_autocmds,
  callback = function()
    vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = my_autocmds,
  callback = function()
    vim.cmd("%s/\\s\\+$//e")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = my_autocmds,
  callback = function()
    local file_path = vim.fn.expand("%:p:h")
    if file_path ~= "" then
      vim.cmd("cd " .. file_path)
    end
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = my_autocmds,
  callback = function()
    local f = vim.fn.filereadable(vim.api.nvim_buf_get_name(0))
    if f == 1 then
      vim.cmd("checktime")
    end
  end,
})
