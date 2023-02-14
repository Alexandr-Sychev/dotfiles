local awful = require("awful")

-- local screen_number = 2

function add_tags(tags)
    local screen_number

    for i, tag in ipairs(tags) do
        if tag.secondary then
            screen_number = 1
        else
            screen_number = 2
        end

        awful.tag.add(tag.name, {
            screen = screen_number,
            layout = awful.layout.layouts[1],
        })
    end
end

local tags = {
    {
        name = "1:Other",
    },
    {
        name = "2: Music",
    },
    {
        name = "3: Telegram",
    },
    {
        name = "4: Other",
    },
    {
        name = "5: Browser",
    },
    {
        name = "6: Terminal",
    },
    {
        name = "1:Other",
        secondary = true,
    },
}

add_tags(tags)
