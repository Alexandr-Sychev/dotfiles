local awful = require('awful')
local utils = require('modules.key_bindings.utils')

local k = utils.create_keybinding_builder('client')

local focus_by_index = function(index)
    return function()
        awful.client.focus.byidx(index)
    end
end

local swap_by_index = function(index)
    return function()
        awful.client.swap.byidx(index)
    end
end

local go_back = function()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end

return {
    k('m', 'j', 'focus next by index', focus_by_index(1)),
    k('m', 'k', 'focus previous by index', focus_by_index( -1)),
    k('ms', 'j', 'swap with next client by index', swap_by_index(1)),
    k('ms', 'k', 'swap with previous client by index', swap_by_index( -1)),
    k('m', 'b', 'go back', go_back),
}
