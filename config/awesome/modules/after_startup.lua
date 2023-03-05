local awful = require("awful")

-- configure layouts
awful.spawn.with_shell(
    'setxkbmap "us,ru" -option grp:alt_shift_toggle'
)

-- init auto screen locking
awful.spawn.with_shell(
    '~/.dotfiles/scripts/screen-locker/init-autolock'
)
