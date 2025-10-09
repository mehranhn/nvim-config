local handlers = require("user.lsp.handlers")

vim.lsp.config('yamlls', {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
    settings = {
        yaml = {
            schemas = require('schemastore').json.schemas(),
        },
    }
})
