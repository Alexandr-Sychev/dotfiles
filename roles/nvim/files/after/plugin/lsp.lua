local lsp = require("lsp-zero")

vim.opt.signcolumn = 'no'

lsp.preset("recommended")

lsp.ensure_installed({
    'sumneko_lua',
    'phpactor',
})

lsp.setup()
