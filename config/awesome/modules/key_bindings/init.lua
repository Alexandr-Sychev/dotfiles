local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" }),
        awful.key({}, "XF86AudioRaiseVolume", function()
            awful.util.spawn("amixer -D pulse sset Master 5%+", false)
        end),

        awful.key({}, "XF86AudioLowerVolume", function()
            awful.util.spawn("amixer -D pulse sset Master 5%-", false)
        end),

        awful.key({}, "XF86AudioMute", function()
            awful.util.spawn("amixer -D pulse sset Master toggle", false)
        end)
    )
end

local create_key_bindings = function(groups)
    local result = {}

    for i, group in ipairs(groups) do
        for j, key_binding in ipairs(group) do
            table.insert(result, key_binding[1])
            table.insert(result, key_binding[2])
            table.insert(result, key_binding[3])
            table.insert(result, key_binding[4])
        end
    end

    return result
end

groups = {
    require('modules.key_bindings.groups.awesome'),
    require('modules.key_bindings.groups.launcher'),
    require('modules.key_bindings.groups.layout'),
    require('modules.key_bindings.groups.screen'),
    require('modules.key_bindings.groups.client'),
    require('modules.key_bindings.groups.other'),
}

globalkeys = gears.table.merge(globalkeys, create_key_bindings(groups))

-- Set keys
root.keys(globalkeys)
-- }}}
