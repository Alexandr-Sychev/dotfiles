vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- use {
    --     'fannheyward/telescope-coc.nvim',
    --     requires = {
    --         {
    --             'neoclide/coc.nvim',
    --             branch = 'release'
    --         }
    --     }
    -- }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        }
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Comments
    use {
        "terrortylor/nvim-comment",
        config = function() require('nvim_comment').setup() end
    }

    -- Tmux integration
    use({
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    })

    -- Floaterm
    use 'voldikss/vim-floaterm'

    -- Table mode
    use 'dhruvasagar/vim-table-mode'

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Colorschemes
    use 'savq/melange-nvim'
    use 'rose-pine/neovim'
    use 'arcticicestudio/nord-vim'
    use 'dracula/vim'
    use 'doums/darcula'
    use 'sainnhe/everforest'

    -- pywal
    use 'dylanaraps/wal.vim'
end)
