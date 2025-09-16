local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
  end,
})

local change_directory_group = vim.api.nvim_create_augroup("ChangeDirectory", {})
vim.api.nvim_create_autocmd("BufEnter", {
  group = change_directory_group,
  callback = function()
    local file_path = vim.fn.expand("%:p:h")
    if file_path ~= "" then
      vim.cmd("cd " .. file_path)
    end
  end,
})

local trim_whitespaces = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = trim_whitespaces,
  pattern = "*",
  callback = function()
    vim.cmd("%s/\\s\\+$//e")
  end,
})
