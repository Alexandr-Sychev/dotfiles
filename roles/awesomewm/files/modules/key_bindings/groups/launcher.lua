local awful = require("awful")

return {
    -- awful.key({ modkey }, "p", function() menubar.show() end,
    --     { description = "show the menubar", group = "launcher" })
    -- awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
    --     { description = "run prompt", group = "launcher" }),
    awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),
    awful.key({ modkey, }, "d", function() awful.spawn.with_shell("rofi -show drun &>> /tmp/rofi.log") end,
        { description = "open rofi", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "w", function() awful.spawn.with_shell("chromium") end,
        { description = "open browser", group = "launcher" }),
}
