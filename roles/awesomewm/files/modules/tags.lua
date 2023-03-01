local awful = require("awful")

local function empty(s)
    return s == nil or s == ''
end

local function choose_screen_number(isSecondary)
    if isSecondary then
        return 1
    else
        return 2
    end
end

local function add_tags(tags)
    for i, tag in ipairs(tags) do
        local screen_number = choose_screen_number(tag.secondary)

        awful.tag.add(tag.name, {
            screen = screen_number,
            layout = awful.layout.layouts[1],
        })

        if not empty(tag.command) then
            awful.spawn(tag.command, {
                tag = awful.tag.find_by_name(awful.screen.focused(), tag.name)
            })
        end
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
    -- {
    --     name = "1:Other",
    --     secondary = true,
    -- },
}

-- add_tags(tags)

awful.tag(
    { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    1,
    awful.layout.layouts[1]
)
