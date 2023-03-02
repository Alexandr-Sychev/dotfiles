local awful = require('awful')
local utils = require('modules.key_bindings.utils')

local k = utils.create_keybinding_builder('screen')

return {
    k('m', 'o', 'focus the next screen', function() awful.screen.focus_relative(1) end),
}
