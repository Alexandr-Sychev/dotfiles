local telescopeBuiltin = require("telescope.builtin");


vim.g.mapleader = " "


-- packer
vim.keymap.set("n", "<leader>ps", ':PackerStatus\n')
vim.keymap.set("n", "<leader>pS", ':PackerSync\n')


-- files navigation and search
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


-- files tree
-- toggle files tree
vim.keymap.set("n", "<leader>e", ':NvimTreeToggle\n')
-- show current file in files tree
vim.keymap.set("n", "<leader>E", ':NvimTreeFindFile\n')


-- splits
-- splits navigation
vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')
-- splits resizing
vim.keymap.set("n", "<C-A-l>", '<C-w>10>')
vim.keymap.set("n", "<C-A-h>", '<C-w>10<')
vim.keymap.set("n", "<C-A-j>", '<C-w>5+')
vim.keymap.set("n", "<C-A-k>", '<C-w>5-')


-- buffer navigaion
-- stay on center during navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "G", "Gzz")


-- buffer actions
-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
-- comment
vim.keymap.set("n", "<leader>/", ':CommentToggle\n')
vim.keymap.set("v", "<leader>/", ':CommentToggle\n')


-- code
-- show signature
vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help, bufopts)
-- code actions
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)


-- floaterm
-- open terminal
vim.keymap.set("n", "<leader>t", ':FloatermNew --width=0.4 --wintype=vsplit --title=terminal zsh <CR>')
-- open lazygit
vim.keymap.set("n", "<leader>G", ':FloatermNew --width=0.9 --height=0.95 --title=lazygit lazygit <CR>')
-- open lazydocker
vim.keymap.set("n", "<leader>td", ':FloatermNew --width=0.9 --height=0.95 --title=lazydocker lazydocker<CR>')
