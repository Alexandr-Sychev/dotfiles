local telescopeBuiltin = require("telescope.builtin");


vim.g.mapleader = " "


-- packer
vim.keymap.set("n", "<leader>ps", ':PackerStatus\n')
vim.keymap.set("n", "<leader>pS", ':PackerSync\n')


-- files navigation and search
-- all not ignored files
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.git_files, {})
-- recent files
vim.keymap.set("n", "<leader>fr", telescopeBuiltin.oldfiles, {})
-- grep
vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, {})
-- open last closed file
vim.keymap.set("n", "<leader><leader>", ':e#\n')


-- todo: git bindings
--
-- gs git status
-- gc git commit
-- gl git log
-- glb git log for current buffer
-- gb git branch
-- gp git pull
-- gP git push


-- git
-- g open lazygit
vim.keymap.set("n", "<leader>G", ':FloatermNew --width=0.9 --height=0.95 --title=lazygit lazygit <CR>')
-- gs - git status
vim.keymap.set("n", "<leader>gs", ':Telescope git_status <CR>')
-- gc - git commit
-- gl - git log
vim.keymap.set("n", "<leader>gl", ':Telescope git_commits <CR>')
-- glb - git log for current buffer
vim.keymap.set("n", "<leader>glb", ':Telescope git_bcommits <CR>')
-- gb - git branch
vim.keymap.set("n", "<leader>gb", ':Telescope git_branches <CR>')
-- gp - git pull
-- gP - git push


-- todo: telescope coc
--
-- for all project:
--   - classes
--
-- for buffer:
--   - methods
--   - actions


-- files tree
-- toggle files tree
vim.keymap.set("n", "<leader>e", ':NvimTreeToggle\n')
-- show current file in files tree
vim.keymap.set("n", "<leader>E", ':NvimTreeFindFile\n')


-- splits
-- creating splits
vim.keymap.set("n", "<leader>v", ':vsp <CR>')
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
-- code actions
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set("n", "<leader>a", ':Telescope coc code_actions <CR>')


-- telescope
vim.keymap.set("n", "<leader>t", ':Telescope <CR>')
vim.keymap.set("n", "<leader>tc", ':Telescope colorscheme<CR>')
vim.keymap.set("n", "<leader>h", ':Telescope help_tags<CR>')
