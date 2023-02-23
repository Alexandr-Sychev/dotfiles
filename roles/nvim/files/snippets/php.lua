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

local group = vim.api.nvim_create_augroup("PHP Snippets", { clear = true })
local file_pattern = "*.php"


-- Start

-- WE NEED
--
-- class - cls <name> <?extends> <?...implements>
-- method - fn <name>
--
-- anonymous function - fn
-- arrow function - afn
--
-- if else
-- while
-- do while
-- for
-- foreach - fre <array_name>
--
-- getters - get <...fields>
-- setters - set <...fields>

local anonymous_function = s("fn", fmt([[
function({}) {{
    {}
}}
]], {
    i(1, ""),
    i(2, "// TODO"),
}))

local arrow_function = s("afn", fmt([[
fn({}) => {}
]], {
    i(1, ""),
    i(2, "/* TODO */"),
}))

table.insert(snippets, anonymous_function)
table.insert(snippets, arrow_function)

-- End



return snippets, autosnippets
