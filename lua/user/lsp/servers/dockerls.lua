local handlers = require("user.lsp.handlers")

vim.lsp.config('dockerls', {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
    settings = {
        docker = {
            languageserver = {
                formatter = {
                    ignoreMultilineInstructions = true,
                },
            },
        }
    }
})
