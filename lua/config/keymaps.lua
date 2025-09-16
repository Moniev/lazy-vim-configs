local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<Tab>", ">>", opts)
vim.keymap.set("n", "<S-Tab>", "<<", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)
vim.keymap.set("i", "<S-Tab>", "<C-d>", opts)

vim.keymap.set("n", "<leader>a", "ggVG", opts)

vim.keymap.set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Find references" })
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover info" })
vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" })

vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "Close buffer" })
