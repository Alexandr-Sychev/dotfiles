local create_keybinding_builder = require('modules.key_bindings.create_keybindings_builder')
local hotkeys_popup = require("awful.hotkeys_popup")

local k = create_keybinding_builder('awesome')

return {
    k('ms', 'h', hotkeys_popup.show_help, 'show help'),
}
