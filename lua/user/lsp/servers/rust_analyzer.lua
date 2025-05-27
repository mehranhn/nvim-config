local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = {}

M.capabilities = capabilities

M.on_attach = require("user.lsp.handlers").on_attach

M.settings = {
    ["rust-analyzer"] = {
        cargo = {
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
            buildScripts = {
                enable = true,
            },
        },
        procMacro = {
            enable = true,
            attributes = {
                enable = true
            },
            --[[ ignored = { ]]
            --[[     ["async_trait"] = {"async_trait"}, ]]
            --[[ }, ]]
        },
    }
}

M.setup = function()
    require('lspconfig').rust_analyzer.setup {
        on_attach = M.on_attach,
        capabilities = capabilities,
        settings = M.settings
    }
end

return M
