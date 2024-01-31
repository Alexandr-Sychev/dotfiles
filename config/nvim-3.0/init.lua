local telescopeBuiltin = require("telescope.builtin")

vim.g.mapleader = " "

-- plugins
require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'neovim/nvim-lspconfig'
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use({
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    })
    use "ellisonleao/gruvbox.nvim"
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

-- autocomplete
local cmp = require "cmp"
cmp.setup {
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    },

    experimental = {
        ghost_text = true,
    },
}

-- lsp
lsp_on_attach = function(client)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})

    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl",
        "<cmd>Telescope diagnostics<cr>", {buffer=0})

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {buffer=0})
end

local lspconfig = require 'lspconfig'
lspconfig.gopls.setup {
    on_attach = lsp_on_attach
}

-- telescope
local telescope = require 'telescope'
telescope.setup {
    defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = { width = 0.8, prompt_position = 'top' }
        },
    },
}

-- help
vim.keymap.set("n", "<leader>h", '<cmd>Telescope help_tags<CR>')

-- git
-- gs - git status
vim.keymap.set("n", "<leader>gs", ':Telescope git_status <CR>')
-- gl - git log
vim.keymap.set("n", "<leader>gla", ':Telescope git_commits <CR>')
-- glb - git log for current file
vim.keymap.set("n", "<leader>glf", ':Telescope git_bcommits <CR>')
-- gb - git branch
vim.keymap.set("n", "<leader>gb", ':Telescope git_branches <CR>')
-- colorscheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

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
vim.opt.termguicolors = true

