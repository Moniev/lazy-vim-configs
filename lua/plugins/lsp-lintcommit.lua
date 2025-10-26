return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        efm = {},
      },
      ensure_installed = {
        "efm",
      },
    },
    config = function(_, opts)
      require("lazyvim.util").lsp.setup(opts)

      local lspconfig = require("lspconfig")
      local home = os.getenv("HOME")
      local commitlintrc = home .. "/.commitlintrc.json"

      lspconfig.efm.setup({
        filetypes = { "gitcommit" },

        init_options = {
          documentFormatting = false,
          documentRangeFormatting = false,
        },

        settings = {
          languages = {
            gitcommit = {
              {
                lintCommand = "commitlint --config " .. commitlintrc .. " --verbose",
                lintStdin = true,
                lintFormats = { "%m" },
              },
            },
          },
        },
      })
    end,
  },
}
