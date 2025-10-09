local handlers = require("user.lsp.handlers")

vim.lsp.config("bashls", {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
})
