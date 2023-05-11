-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.nvim_tree_show_icons = {
    folders = 0,
    files = 0,
    git = 0,
    folder_arrows = 0,
}

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        mappings = {
            custom_only = false,
            list = {
                {
                    key = "l",
                    action = "edit",
                },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

