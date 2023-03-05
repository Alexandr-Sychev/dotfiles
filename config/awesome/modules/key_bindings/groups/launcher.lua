local utils = require('modules.key_bindings.utils')

local k = utils.create_keybinding_builder('launcher')
local s = utils.spawn
local ss = utils.spawn_with_shell

local rofi_command = 'rofi -show drun &>> /tmp/rofi.log'

return {
    k('m', 'Return', 'open a terminal', s(terminal)),
    k('m', 'd', 'open the rofi', ss(rofi_command)),
    k('m', 'w', 'open a browser', ss('chromium')),

    -- awful.key({ modkey }, "p", function() menubar.show() end,
    --     { description = "show the menubar", group = "launcher" })
    -- awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
    --     { description = "run prompt", group = "launcher" })
}
