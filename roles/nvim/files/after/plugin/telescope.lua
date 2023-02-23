require('telescope').setup {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
            },
        },
        sorting_strategy = "ascending",
    },

    pickers = {
        find_files = {
            no_ignore = true,
        }
    },
}
