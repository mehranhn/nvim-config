local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').sqls.setup{
    cmd = {"sqls"}, -- , "-config", "path/to/config.yml"};
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = capabilities,
    settings = {
        sqls = {
            {
                driver = 'postgresql',
                dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=password dbname=shop sslmode=disable',
            },
        },
    },
}
