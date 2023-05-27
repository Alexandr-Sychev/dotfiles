vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Files tree
    use {
        'nvim-tree/nvim-tree.lua',
        -- config = function()
        --     require("nvim-tree").setup {}
        -- end
    }
    -- use "nvim-tree/nvim-web-devicons"

    -- Tmux integration
    use {
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    } 

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Comments
    use {
        "terrortylor/nvim-comment",
        config = function() require('nvim_comment').setup() end
    }
end)
