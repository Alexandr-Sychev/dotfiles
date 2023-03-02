local awful = require("awful")
local create_keybinding_builder = require('modules.key_bindings.create_keybindings_builder')
local hotkeys_popup = require("awful.hotkeys_popup")

local k = create_keybinding_builder('awesome')

local lock_screen = function() awful.spawn.with_shell("~/.dotfiles/scripts/screen-locker/lockscreen") end
local open_power_manager = function() awful.spawn.with_shell("~/.dotfiles/scripts/de/open-power-management-menu.py") end
local open_bluetooth_manager = function() awful.spawn.with_shell("/bin/rofi-bluetooth/rofi-bluetooth") end

return {
    k('m', 'l', 'lockscreen', lock_screen),
    k('m', 'p', 'open power manager', open_power_manager),
    k('ms', 'r', 'reload awesome', awesome.restart),
    k('m', 'b', 'open bluetooth manager', open_bluetooth_manager),
    k('m', 'w', 'show main menu', function() mymainmenu:show() end),
    k('ms', 'h', 'show help', hotkeys_popup.show_help),
}
