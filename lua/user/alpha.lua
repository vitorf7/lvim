local icons = require "user.icons"
local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")

local my_buttons = {}
if status_ok then
  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Macro"
    return b
  end
  my_buttons = {
   button("u", icons.ui.CloudDownload .. " Update Packer", ":PackerSync<CR>"),
   button("l", icons.ui.CloudDownload .. " Update LunarVim", ":LvimUpdate<CR>"),
   button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }
end

local lvim_buttons = lvim.builtin.alpha.dashboard.section.buttons.val
for _, button in pairs(my_buttons) do
  table.insert(
    lvim_buttons,
    button
  )
end
