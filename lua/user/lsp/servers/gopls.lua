local handlers = require("user.lsp.handlers")

vim.lsp.config("gopls", {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
})
