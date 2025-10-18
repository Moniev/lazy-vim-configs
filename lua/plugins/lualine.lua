return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {},
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "diagnostics" },
      lualine_c = {
        "branch",
        "filename",
      },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
