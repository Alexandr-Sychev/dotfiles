local lsp = require("lsp-zero")

vim.opt.signcolumn = 'no'

lsp.preset("recommended")

lsp.ensure_installed({
    'lua_ls',
    'phpactor',
})

lsp.setup()
