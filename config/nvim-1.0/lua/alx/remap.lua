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
vim.keymap.set("n", "<leader><leader>", ':e#\n', { silent = true })


-- git
-- g open lazygit
vim.keymap.set("n", "<leader>G", ':FloatermNew --width=0.9 --height=0.95 --title=lazygit lazygit <CR>')
-- gs - git status
vim.keymap.set("n", "<leader>gs", ':Telescope git_status <CR>')
-- gl - git log
vim.keymap.set("n", "<leader>gl", ':Telescope git_commits <CR>')
-- glb - git log for current buffer
vim.keymap.set("n", "<leader>glb", ':Telescope git_bcommits <CR>')
-- gb - git branch
vim.keymap.set("n", "<leader>gb", ':Telescope git_branches <CR>')


-- files tree
-- toggle files tree
vim.keymap.set("n", "<leader>e", ':NvimTreeToggle\n', { silent = true })
-- show current file in files tree
vim.keymap.set("n", "<leader>E", ':NvimTreeFindFile\n', { silent = true })


-- splits
-- creating splits
vim.keymap.set("n", "<leader>v", ':vsp <CR>', { silent = true })
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
vim.keymap.set("n", "<leader>/", ':CommentToggle\n', { silent = true })
vim.keymap.set("v", "<leader>/", ':CommentToggle\n', { silent = true })


-- lsp
-- code actions
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
-- problems in current buffer
vim.keymap.set("n", "<leader>d", ':Telescope diagnostics bufnr=0 <CR>')
-- problems in all buffers
vim.keymap.set("n", "<leader>D", ':Telescope diagnostics <CR>')
-- problems navigaion
vim.keymap.set("n", "dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "dN", vim.diagnostic.goto_prev)


-- telescope
vim.keymap.set("n", "<leader>t", ':Telescope <CR>')
vim.keymap.set("n", "<leader>tc", ':Telescope colorscheme<CR>')
vim.keymap.set("n", "<leader>h", ':Telescope help_tags<CR>')


-- spellchecking
vim.keymap.set("n", "<f11>", ':set spell! <cr>', { silent = true })
