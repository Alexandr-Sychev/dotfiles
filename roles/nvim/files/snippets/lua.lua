local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local createSnippet = function(trigger, snippet, auto)
    local snippet = s(trigger, snippet)
    local snippets_list

    if auto == nil or auto == false then
        snippets_list = snippets
    else
        snippets_list = autosnippets
    end

    table.insert(snippets_list, snippet)
end



-- Start

-- local lf = fmt([[
--     local {} = function({})
--         {}
--     end
--
--
-- ]], {
--     i(1, "func"),
--     c(2, { t(""), i(1, "args") }),
--     i(3, "-- TODO: implement"),
-- })

local first_capture = function(_, snip)
    return snip.captures[1]
end

local lf = s({
    trig = "lf (\\w*)",
    regTrig = true,
}, fmt([[
    local {} = function({})
        {}
    end


]], {
    f(first_capture),
    c(1, { t(""), i(1, "args") }),
    i(2, "-- TODO: implement"),
}))

table.insert(snippets, lf)

-- End






return snippets, autosnippets
