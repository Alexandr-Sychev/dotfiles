local awful = require("awful")

return {


    awful.key({ modkey, }, "o", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, }, "u",
        function() awful.screen.focus(1) end,
        { description = "open secondary screen", group = "screen" }),

    awful.key({ modkey, }, "i",
        function() awful.screen.focus(2) end,
        { description = "open main screen", group = "screen" }),

}
