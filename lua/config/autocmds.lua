local my_autocmds = vim.api.nvim_create_augroup("MyAutocmds", { clear = true })

local autocmds = {
  {
    event = "BufWritePre",
    callback = function()
      vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
    end,
    desc = "Format file before saving",
  },
  {
    event = "BufWritePre",
    callback = function()
      vim.cmd("%s/\\s\\+$//e")
    end,
    desc = "Trim trailing whitespace on save",
  },
  {
    event = { "CursorHold", "CursorHoldI" },
    callback = function()
      local f = vim.fn.filereadable(vim.api.nvim_buf_get_name(0))
      if f == 1 then
        vim.cmd("checktime")
      end
    end,
    desc = "Check for file changes on disk",
  },
}

for _, autocmd in ipairs(autocmds) do
  vim.api.nvim_create_autocmd(autocmd.event, {
    group = my_autocmds,
    callback = autocmd.callback,
    desc = autocmd.desc,
  })
end
