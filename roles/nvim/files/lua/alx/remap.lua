vim.g.mapleader = " "

local telescopeBuiltin = require("telescope.builtin");

-- search and navigation
-- all not ignored files
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, {})
-- recent files
vim.keymap.set("n", "<leader>fr", telescopeBuiltin.oldfiles, {})
-- grep
vim.keymap.set("n", "<leader>g", telescopeBuiltin.live_grep, {})
-- grep by word under cursor
vim.keymap.set("n", "<leader>gw", telescopeBuiltin.grep_string, {})
-- open last closed file
vim.keymap.set("n", "<leader><leader>", ':e#\n')

-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
-- comment
vim.keymap.set("n", "<leader>/", ':CommentToggle\n')
vim.keymap.set("v", "<leader>/", ':CommentToggle\n')

-- buffers navigation
vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')

-- toggle files tree
vim.keymap.set("n", "<leader>e", ':NvimTreeToggle\n')
-- show current file in files tree
vim.keymap.set("n", "<leader>E", ':NvimTreeFindFile\n')

-- packer
vim.keymap.set("n", "<leader>ps", ':PackerStatus\n')
vim.keymap.set("n", "<leader>pS", ':PackerSync\n')

-- code
-- show signature
vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
