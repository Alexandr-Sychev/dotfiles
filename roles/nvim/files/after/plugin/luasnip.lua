-- https://www.youtube.com/watch?v=ub0REXjhpmk


local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

local types = require("luasnip.util.types")

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = false,

    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    -- Crazy highlights!!
    -- #vid3
    -- ext_opts = nil,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
}


local jump_forward = function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end

local jump_backward = function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

local next_choice = function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end

local prev_choice = function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end


-- snippets keybindings
vim.keymap.set({ "i", "s" }, "<a-l>", jump_forward)
vim.keymap.set({ "i", "s" }, "<a-h>", jump_backward)
vim.keymap.set({ "i", "s" }, "<a-j>", next_choice)
vim.keymap.set({ "i", "s" }, "<a-k>", prev_choice)
