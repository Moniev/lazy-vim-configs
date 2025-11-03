local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "
vim.o.timeoutlen = 300

local keymaps = {
  n = {
    { "<Tab>", ">>", opts },
    { "<S-Tab>", "<<", opts },
    { "<leader>a", "ggVG", opts },
    { "<leader>d", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" } },
    { "<leader>r", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Find references" } },

    { "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover info" } },

    { "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" } },
    { "<C-s>", ":w<cr>", { desc = "Save file" } },
    { "<leader>q", ":q<cr>", { desc = "Close buffers" } },

    { "<leader>c", ":bd<cr>", { desc = "Close currently open buffer (bd)" } },

    {
      "<leader><S-c>",
      function()
        require("Comment.api").toggle.blockwise.current()
      end,
      { desc = "Toggle comment" },
    },

    { "<A-a>", "<C-w>h", { desc = "Go to left window" } },
    { "<A-s>", "<C-w>j", { desc = "Go to window below" } },
    { "<A-w>", "<C-w>k", { desc = "Go to window above" } },
    { "<A-d>", "<C-w>l", { desc = "Go to right window" } },

    { "<A-Left>", "<C-w>h", { desc = "Go to left window" } },
    { "<A-Down>", "<C-w>j", { desc = "Go to window below" } },
    { "<A-Up>", "<C-w>k", { desc = "Go to window above" } },
    { "<A-Right>", "<C-w>l", { desc = "Go to right window" } },

    { "<leader>gs", "<cmd>G<cr>", { desc = "Git status" } },
    { "<leader>gb", "<cmd>Gblame<cr>", { desc = "Git blame" } },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" } },
    { "<leader>ga", "<cmd>Gwrite<cr>", { desc = "Git add (current buffer)" } },
    { "<leader>gc", "<cmd>G commit<cr>", { desc = "Git commit" } },
    { "<leader>gA", "<cmd>G add --all<cr>", { desc = "Git add all" } },
    { "<leader>gP", "<cmd>G push<cr>", { desc = "Git push" } },
    { "<leader>gL", "<cmd>G pull<cr>", { desc = "Git pull" } },
    { "<leader>gS", "<cmd>G stash<cr>", { desc = "Git stash" } },
    { "<leader>gsp", "<cmd>G stash pop<cr>", { desc = "Git stash pop" } },
    { "<leader>gsa", "<cmd>G stash apply<cr>", { desc = "Git stash apply" } },
    { "<leader>gR", "<cmd>G restore<cr>", { desc = "Git restore" } },
    { "<leader>gl", "<cmd>G stash list<cr>", { desc = "Git stash list" } },
  },

  v = {
    { "<Tab>", ">gv", opts },
    { "<S-Tab>", "<gv", opts },
    {
      "<leader><S-c>",
      "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
      { desc = "Toggle comment" },
    },
  },

  i = {
    { "<S-Tab>", "<C-d>", opts },
    {
      "<leader><S-c>",
      "<Esc><cmd>lua require('Comment.api').toggle.blockwise.current()<CR>a",
      { desc = "Toggle comment" },
    },
  },
}

for mode, maps_table in pairs(keymaps) do
  for _, mapping in ipairs(maps_table) do
    local m_opts = mapping[3] or {}
    map(mode, mapping[1], mapping[2], m_opts)
  end
end
