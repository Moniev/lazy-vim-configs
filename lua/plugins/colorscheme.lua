return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"

      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        italic_inlayhints = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,

        color_overrides = {
          vscLineNumber = "#888888",
        },

        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = not vim.g.neovide,

      on_highlights = function(hl)
        local p = require("config.palette")

        local my_bg = vim.g.neovide and p.primary or p.none

        hl.NeoTreeNormal = { bg = my_bg }
        hl.NeoTreeNormalNC = { bg = my_bg }
        hl.NeoTreeEndOfBuffer = { bg = my_bg }
        hl.NeoTreeWinSeparator = { fg = p.primary, bg = p.none }
        hl.WinSeparator = { fg = p.primary, bg = p.none }

        hl.TelescopeNormal = { bg = my_bg }
        hl.TelescopeBorder = { bg = my_bg, fg = p.primary }
        hl.TelescopePromptNormal = { bg = my_bg }
        hl.TelescopePromptBorder = { bg = my_bg, fg = p.primary }
        hl.TelescopeTitle = { bg = p.info, fg = p.primary }

        hl.NormalFloat = { bg = my_bg }
        hl.FloatBorder = { bg = my_bg, fg = p.primary }

        hl.Normal = { bg = my_bg }
        hl.NormalNC = { bg = my_bg }
        hl.SignColumn = { bg = my_bg }
        hl.EndOfBuffer = { bg = my_bg }

        hl.Cursor = { bg = p.info, fg = p.primary }
        hl.TermCursor = { bg = p.info, fg = p.primary }
        hl.LineNr = { fg = p.grey, bg = my_bg }

        hl.Visual = { bg = p.secondary, fg = p.white }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
