local awful = require("awful")

awful.spawn.with_shell(
    'setxkbmap "us,ru" -option grp:alt_shift_toggle'
)
