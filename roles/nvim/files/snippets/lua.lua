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

local inlineFunc = s("if", fmt([[
    function({}) {} end
]], {
    i(1, ""),
    i(2, "--[[ TODO --]]"),
}))

local anonymousFunc = s("f", fmt([[
    function({})
        {}
    end
]], {
    i(1, ""),
    i(2, "-- TODO"),
}))

local lf = s({
    trig = "lf ([%w_]+)",
    regTrig = true,
}, fmt([[
    local {} = function({})
        {}
    end


]], {
    d(1, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
    end),
    i(2, ""),
    i(3, "-- TODO: implement"),
}))

table.insert(snippets, inlineFunc)
table.insert(snippets, anonymousFunc)
table.insert(snippets, lf)

-- End





return snippets, autosnippets
