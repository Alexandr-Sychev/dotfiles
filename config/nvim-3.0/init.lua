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
    use "terrortylor/nvim-comment"
end)

-- utils
function kn(...) vim.keymap.set("n", unpack({...})) end
function kv(...) vim.keymap.set("v", unpack({...})) end
function knv(...)
    kn(unpack({...}))
    kv(unpack({...}))
end
function t(command) return "<cmd>Telescope " .. command .. " <CR>" end

-- open vim config
kn("<leader>C", ":e ~/.config/nvim/init.lua<cr>")

-- buffer navigaion
-- stay on center during navigation
kn("<C-d>", "<C-d>zz")
kn("<C-u>", "<C-u>zz")
kn("n", "nzz")
kn("N", "Nzz")
kn("G", "Gzz")

-- splits
-- create
kn("<leader>v", ':vsp <CR>', { silent = true })
-- navigate
kn("<C-h>", '<C-w>h')
kn("<C-j>", '<C-w>j')
kn("<C-k>", '<C-w>k')
kn("<C-l>", '<C-w>l')
-- resize
kn("<C-A-l>", '<C-w>10>')
kn("<C-A-h>", '<C-w>10<')
kn("<C-A-j>", '<C-w>5+')
kn("<C-A-k>", '<C-w>5-')

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
kn("<leader>fl", telescopeBuiltin.find_files, {})
-- all not ignored files
kn("<leader>ff", telescopeBuiltin.git_files, {})
-- recent files
kn("<leader>fr", telescopeBuiltin.oldfiles, {})
-- grep
kn("<leader>fg", telescopeBuiltin.live_grep, {})
-- edited files
kn("<leader>fe", t("git_status"))
-- open last closed file
kn("<leader><leader>", ':e#\n', { silent = true })

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

-- comment
require('nvim_comment').setup()
knv("<leader>/", ":CommentToggle<CR>", { silent = true })

-- lsp
require("lsp")

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

-- vim help
kn("<leader>h", '<cmd>Telescope help_tags<CR>')

-- git
-- gl - git log
kn("<leader>gla", ':Telescope git_commits <CR>')
-- glb - git log for current file
kn("<leader>glf", ':Telescope git_bcommits <CR>')
-- gb - git branch
kn("<leader>gb", ':Telescope git_branches <CR>')

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






-- tests
function run_bash_command_and_send_output_to_new_buffer(cmd)
    local handle = io.popen(cmd)
    local result = handle:read('*a')
    handle:close()

    local lines = {}
    for line in string.gmatch(result, "[^\n]+") do
        table.insert(lines, line)
    end

    vim.cmd('vnew')
    if #lines > 0 then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    else
        vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
        vim.api.nvim_buf_set_option(0, 'bufhidden', 'delete')
    end
    vim.bo[0].filetype = 'sh'
end

local path_sep = "/"

function split_string(input, separator)
    local parts = {}
    for part in string.gmatch(input, "([^" .. separator .. "]+)") do
        table.insert(parts, part)
    end
    return parts
end

function split_path(path)
    return split_string(path, path_sep)
end

function get_current_file_path()
    return vim.fn.expand('%:p')
end

function getcwd()
    return vim.fn.getcwd()
end

function get_current_file_path_relative_to_cwd()
    local current_buffer = vim.api.nvim_get_current_buf()
    local file_path = vim.api.nvim_buf_get_name(current_buffer)
    local cwd = vim.fn.getcwd()
    local relative_path = vim.fn.fnamemodify(file_path, ":~:.:.")
    local path_relative_to_cwd = vim.fn.fnamemodify(relative_path, ":.")

    return path_relative_to_cwd
end

function table_join(tbl, sep)
    local result = ""
    for i, v in ipairs(tbl) do
        result = result .. v
        if i < #tbl then
            result = result .. sep
        end
    end
    return result
end

function table_slice(tbl, first, last, step)
    local sliced = {}
    for i = first or 1, last or #tbl, step or 1 do
        table.insert(sliced, tbl[i])
    end
    return sliced
end

function try_to_run_exam_tests()
    local p = get_current_file_path_relative_to_cwd()
    local sp = split_path(p)

    if sp[1] ~= 'tests' then
        print('not in tests directory')
        return
    end

    local suite = sp[2]
    local t = table_slice(sp, 3, #sp, 1)
    t = table_join(t, '/')
    local test = split_string(t, '.')[1]

    run_tests_cmd = string.format(
        "./backend test --modificators \"%s %s --no-colors\"", suite, test
    )

    print(suite)
    print(test)
    print(run_tests_cmd)
    run_bash_command_and_send_output_to_new_buffer(run_tests_cmd)
end

function m()
    try_to_run_exam_tests()
end

--kn('<leader>t', ':lua m()<CR>')
