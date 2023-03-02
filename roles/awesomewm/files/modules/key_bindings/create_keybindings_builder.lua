local awful = require("awful")

local parse_mods = function(mods)
    local result = {}

    local mods_map = {
        m = modkey,
        a = 'Alt',
        c = 'Ctrl',
        s = 'Shift',
    }

    for mod_alias in mods:gmatch "." do
        table.insert(result, mods_map[mod_alias])
    end

    return result
end

local create_keybinding_builder = function(group)
    return function(mods, key, action, description)
        return awful.key(parse_mods(mods), key, action, {
            description = description,
            group = group
        })
    end
end

return create_keybinding_builder
