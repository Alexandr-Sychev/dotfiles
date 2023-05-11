vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Files tree
    use {
        'nvim-tree/nvim-tree.lua',
--         config = function()
--             require("nvim-tree").setup {}
--         end
    }
end)
