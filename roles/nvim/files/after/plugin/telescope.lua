local telescope = require('telescope')

telescope.setup {
    defaults = {
        path_display = {
            "shorten",
        },
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 70,
                height = 0.9,
                width = 0.8,
            },
        },
        sorting_strategy = "ascending",
    },

    extensions = {
        -- coc = {
        --     theme = 'ivy',
        --     prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        -- }
    },

    pickers = {
        find_files = {
            no_ignore = true,
        }
    },
}

-- telescope.load_extension('coc')
