local handlers = require("user.lsp.handlers")

vim.lsp.config('sqls', {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
    -- cmd = {"path/to/command", "-config", "path/to/config.ym  cmd = {"path/to/command", "-config", "path/to/config.yml"},"},
    cmd = { "sqls" }, -- , "-config", "path/to/config.yml"};
    settings = {
        sqls = {
            {
                driver = 'postgresql',
                dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=password dbname=shop sslmode=disable',
            },
        },
    },
})
