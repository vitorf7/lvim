local icons = require "user.icons"
local dashboard = require "alpha.themes.dashboard"
local my_buttons = {
  dashboard.button("u", icons.ui.CloudDownload .. " Update Packer", ":PackerSync<CR>"),
  dashboard.button("l", icons.ui.CloudDownload .. " Update LunarVim", ":LvimUpdate<CR>"),
  dashboard.button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}

local lvim_buttons = lvim.builtin.alpha.dashboard.section.buttons.val
for _, button in pairs(my_buttons) do
  table.insert(
    lvim_buttons,
    button
  )
end
