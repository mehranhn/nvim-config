local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.solidity.setup({
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = capabilities,
    settings = {
        -- example of global remapping
        solidity = {
            includePath = '',
            --[[ remapping = { ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/' }, ]]
            -- Array of paths to pass as --allow-paths to solc
            allowPaths = {}
        }
    },
})
