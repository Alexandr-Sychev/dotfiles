print('hello from lsp')

lsp.preset("recommended")

lsp.ensure_installed {
    -- markdown and other markup languages
    -- 'ltex',
    -- javascript, typescript
    -- 'tsserver',
    -- lua
    'lua_ls',
    -- php
    'phpactor',
}

lsp.setup()
