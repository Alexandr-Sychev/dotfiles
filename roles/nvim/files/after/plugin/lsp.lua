local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'phpactor',
})

lsp.setup()
