local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').ccls.setup {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = capabilities,
    init_options = {
        cache = {
            directory = "/tmp/ccls";
        },
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
}
