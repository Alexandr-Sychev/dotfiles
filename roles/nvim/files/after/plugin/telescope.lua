local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
            },
        },
        sorting_strategy = "ascending",
    },

    extensions = {
        coc = {
            theme = 'ivy',
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        }
    },

    pickers = {
        find_files = {
            no_ignore = true,
        }
    },
}

telescope.load_extension('coc')
