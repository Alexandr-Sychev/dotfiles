local utils = require('modules.key_bindings.utils')

local k = utils.create_keybinding_builder('awesome')
local ss = utils.spawn_with_shell

local hotkeys_popup = require('awful.hotkeys_popup')

local lock_screen = '~/.dotfiles/scripts/screen-locker/lockscreen'
local power_manager = '~/.dotfiles/scripts/de/open-power-management-menu.py'
local bluetooth_manager = '/bin/rofi-bluetooth/rofi-bluetooth'

return {
    k('m', 'l', 'lockscreen', ss(lock_screen)),
    k('m', 'p', 'open power manager', ss(power_manager)),
    k('ms', 'r', 'reload awesome', awesome.restart),
    k('m', 'b', 'open bluetooth manager', ss(bluetooth_manager)),
    k('m', 'w', 'show main menu', function() mymainmenu:show() end),
    k('ms', 'h', 'show help', hotkeys_popup.show_help),
}
