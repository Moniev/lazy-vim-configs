local opts = { noremap = true, silent = true }
local map = vim.keymap.set
vim.g.mapleader = " "

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
    { "<leader>q", ":q<cr>", { desc = "Close buffer" } },
  },

  v = {
    { "<Tab>", ">gv", opts },
    { "<S-Tab>", "<gv", opts },
  },

  i = {
    { "<S-Tab>", "<C-d>", opts },
  },
}

for mode, maps in pairs(keymaps) do
  for _, mapping in ipairs(maps) do
    if #mapping == 3 then
      map(mode, mapping[1], mapping[2], mapping[3])
    else
      local key = mapping[1]
      local rhs = mapping[2]
      local custom_opts = mapping[3]
      local final_opts = vim.tbl_deep_extend("force", {}, opts, custom_opts)
      map(mode, key, rhs, final_opts)
    end
  end
end
