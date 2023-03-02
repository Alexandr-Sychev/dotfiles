local awful = require('awful')
local utils = require('modules.key_bindings.utils')

local k = utils.create_keybinding_builder('layout')

local resize_width_value = 0.07

local change_width = function(width)
    return function() awful.tag.incmwfact(width) end
end

return {
    k('m', 'space', 'select next', function() awful.layout.inc(1) end),
    k('m', 'l', 'increase master width factor', change_width(resize_width_value)),
    k('m', 'h', 'decrease master width factor', change_width( -resize_width_value)),
}
