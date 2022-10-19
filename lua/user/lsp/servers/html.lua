local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = capabilities,
}
