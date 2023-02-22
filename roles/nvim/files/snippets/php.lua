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
local file_pattern = "*.php"


-- Start

-- WE NEED
--
-- class - cls <name>
-- method - fn <name>
--
-- anonymous function - fn
-- arrow function - afn
-- inline arrow function - ifn
--
-- if else
-- while
-- do while
-- for
-- foreach - fre <array_name>
--
-- getters - get <...fields>
-- setters - set <...fields>

-- End


return snippets, autosnippets
