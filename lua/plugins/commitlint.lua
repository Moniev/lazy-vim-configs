return {
  "neovim/nvim-lspconfig",

  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "efm")
      end,
    },
  },

  opts = {
    servers = {
      efm = {
        filetypes = { "gitcommit" },
        init_options = {
          documentFormatting = false,
          documentRangeFormatting = false,
        },
        settings = {
          languages = {
            gitcommit = {
              {
                lintCommand = "commitlint --config " .. os.getenv("HOME") .. "/.commitlintrc.json --verbose",
                lintStdin = true,
                lintFormats = { "%m" },
              },
            },
          },
        },
      },
    },
  },
}
