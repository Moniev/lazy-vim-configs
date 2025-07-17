return {
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    opts = {
      transparent = false,
      italic_comments = true,
      disable_nvimtree_bg = true,
      color_overrides = {
        vscLineNumber = "#888888",
      },
      group_overrides = {
        Cursor = { fg = "#000000", bg = "#0FE1EE", bold = false },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
