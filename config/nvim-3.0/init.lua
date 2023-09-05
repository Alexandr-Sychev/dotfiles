local telescopeBuiltin = require("telescope.builtin");

vim.g.mapleader = " "

-- plugins
require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "terrortylor/nvim-comment"
end)

-- buffer navigaion
-- stay on center during navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "G", "Gzz")

-- splits
-- create
vim.keymap.set("n", "<leader>v", ':vsp <CR>', { silent = true })
-- navigate
vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')
-- resize
vim.keymap.set("n", "<C-A-l>", '<C-w>10>')
vim.keymap.set("n", "<C-A-h>", '<C-w>10<')
vim.keymap.set("n", "<C-A-j>", '<C-w>5+')
vim.keymap.set("n", "<C-A-k>", '<C-w>5-')

-- buffer search
vim.keymap.set('n', '<leader>s', function()
	telescopeBuiltin.current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown {
            winblend = 0, -- transparency
            previewer = false,
        }
    )
end)

-- files navigation and search
-- directory view
-- vim.keymap.set("n", "<leader>fl", ':Explore\n', { silent = true })
vim.keymap.set("n", "<leader>fl", telescopeBuiltin.find_files, {})
-- all not ignored files
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.git_files, {})
-- recent files
vim.keymap.set("n", "<leader>fr", telescopeBuiltin.oldfiles, {})
-- grep
vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, {})
-- open last closed file
vim.keymap.set("n", "<leader><leader>", ':e#\n', { silent = true })

-- comment
vim.keymap.set("n", "<leader>/", ':CommentToggle\n', { silent = true })

-- opts
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = false
vim.opt.signcolumn = 'no'
vim.opt.termguicolors = false

