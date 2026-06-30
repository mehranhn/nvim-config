local handlers = require("user.lsp.handlers")
local capabilities = handlers.capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("jsonls", {
    capabilities = capabilities,
    on_attach = handlers.on_attach,
    settings = {
        json = {
            -- schemas = extended_schemas,
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})
