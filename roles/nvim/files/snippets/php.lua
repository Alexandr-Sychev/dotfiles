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
-- start - <?
--
-- class - cls <name> <?extends> ?i <?...implements>
--
-- method - fn <name>
-- empty constuctor - conse
-- full constructor - consf
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


local start = s("<?", fmt([[
<?php

namespace {};

]], {
    i(1, "Namespace"),
}))


local method = s({
    trig = "fn ([%w]+)",
    regTrig = true,
}, fmt([[
{} function {}({}): {}
{{
    {}
}}
]], {
    c(1, {
        t("public"),
        t("private"),
        t("protected"),
    }),
    d(2, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
    end),
    i(3, ""),
    c(4, {
        i(1, ""),
        t("void"),
        t("array"),
        t("int"),
        t("bool"),
        t("float"),
        t("object"),
    }),
    i(5, "// TODO: implement"),
    -- f(5, function(_, snip)
    --     return "// TODO: implement method " .. snip.captures[1]
    -- end),
}))


local empty_contructor = s("conse", fmt([[
public function __construct({})
{{
    {}
}}
]], {
    i(1, ""),
    i(2, "// TODO"),
}))


local anonymous_func = s("fn", fmt([[
function({}) {{
    {}
}}
]], {
    i(1, ""),
    i(2, "// TODO"),
}))


local arrow_func = s("afn", fmt([[
fn({}) => {}
]], {
    i(1, ""),
    i(2, "/* TODO */"),
}))


table.insert(snippets, start)

table.insert(snippets, method)
table.insert(snippets, empty_contructor)

table.insert(snippets, anonymous_func)
table.insert(snippets, arrow_func)

-- End



return snippets, autosnippets
