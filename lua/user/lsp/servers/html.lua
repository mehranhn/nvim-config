local handlers = require("user.lsp.handlers")
local capabilities = handlers.capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("html", {
    capabilities = capabilities,
    on_attach = handlers.on_attach,
})
