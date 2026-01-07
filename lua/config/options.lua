vim.opt.shortmess:append("I")
vim.o.shell = "fish"
if vim.fn.has("gui_running") then
  vim.opt.guifont = { "JetBrainsMonoNL Nerd Font", ":h12" }
end

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMonoNL Nerd Font:h12"

  vim.g.neovide_padding_top = 25
  vim.g.neovide_padding_bottom = 25
  vim.g.neovide_padding_left = 25
  vim.g.neovide_padding_right = 25

  vim.g.neovide_opacity = 0.78

  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_animation_length = 0.06
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 200.0

  vim.cmd([[
        highlight Normal guibg=#292a2bc7
        highlight EndOfBuffer guibg=#292a2bc7
        highlight SignColumn guibg=#292a2bc7
        highlight LineNr guibg=#292a2bc7

        highlight Cursor guibg=#599ba7 guifg=#292a2b
    ]])

  vim.g.neovide_remember_window_size = true
  vim.o.winblend = 0
  vim.o.pumblend = 0
  vim.g.neovide_window_blurred = false
  vim.g.neovide_floating_shadow = false
end
