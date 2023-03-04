local awful = require('awful')
local utils = require('modules.key_bindings.utils')

local k = utils.create_keybinding_builder('other')
local ss = utils.spawn_with_shell

watch_later_cmd = '/bin/bash -c /home/alx/.dotfiles/scripts/watch-later'

return {
    k('m', 'b', 'add to watch later list', ss(watch_later_cmd))
}
