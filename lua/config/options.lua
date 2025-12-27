vim.opt.shortmess:append("I")
vim.o.shell = "fish"
if vim.fn.has("gui_running") then
  vim.opt.guifont = "JetBrains\\ Mono\\ NL\\ Nerd\\ Font\\ Bold\\"
end

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
