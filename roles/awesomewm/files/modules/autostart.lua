local awful = require("awful")

-- function run_once(prg, arg_string, pname, screen)
--     if not prg then
--         do return nil end
--     end
--
--     if not pname then
--         pname = prg
--     end
--
--     if not arg_string then
--         awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")", screen)
--     else
--         awful.util.spawn_with_shell(
--             "pgrep -f -u $USER -x '" .. pname .. " " .. arg_string .. "' || (" .. prg .. " " .. arg_string .. ")", screen)
--     end
-- end

-- local calendar_url = 'https://calendar.google.com/calendar/u/0/r/week'

-- run_once('chromium')
-- run_once(terminal)

-- function spawn_once(command, class, tag)
--     -- create move callback
--     local callback
--     callback = function(c)
--         if c.class == class then
--             awful.client.movetotag(tag, c)
--             client.remove_signal("manage", callback)
--         end
--     end
--     client.add_signal("manage", callback)
--     -- now check if not already running!
--     local findme = command
--     local firstspace = findme:find(" ")
--     if firstspace then
--         findme = findme:sub(0, firstspace - 1)
--     end
--     -- finally run it
--     awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. command .. ")")
-- end

-- local spawn_screen = 2
--
-- spawn_once('chromium ' .. calendar_url, 'Chromium', tags[spawn_screen][2])
-- spawn_once('chromium', 'Chromium', tags[spawn_screen][5])
-- spawn_once(terminal, 'Terminal', tags[spawn_screen][6])

-- use the spawn_once
-- spawn_once("subl", "Sublime_text", tags[1][2])
-- spawn_once("chromium", "Chromium", tags[1][3])
-- spawn_once("thunar", "Thunar", tags[1][4])
-- spawn_once("xchat", "Xchat", tags[1][5])

-- run_once("xscreensaver", "-no-splash")
-- run_once("pidgin", nil, nil, 2)
-- run_once("wicd-client", nil, "/usr/bin/python2 -O /usr/share/wicd/gtk/wicd-client.py")
