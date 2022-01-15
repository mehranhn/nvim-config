local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').yamlls.setup {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
        },
    }
}
