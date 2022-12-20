vim.g.mapleader = " "

local telescopeBuiltin = require("telescope.builtin");

-- search
-- all not ignored files
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, {})
-- recent files
vim.keymap.set("n", "<leader>fr", telescopeBuiltin.oldfiles, {})
-- grep
vim.keymap.set("n", "<leader>g", telescopeBuiltin.live_grep, {})
-- grep by word under cursor
vim.keymap.set("n", "<leader>gw", telescopeBuiltin.grep_string, {})

-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
-- comment
vim.keymap.set("n", "<leader>/", ':CommentToggle\n')
vim.keymap.set("v", "<leader>/", ':CommentToggle\n')

-- change buffer
vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')

-- toggle files tree
vim.keymap.set("n", "<leader>e", ':NvimTreeToggle\n')
-- show current file in files tree
vim.keymap.set("n", "<leader>E", ':NvimTreeFindFile\n')
