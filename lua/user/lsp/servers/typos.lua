local handlers = require("user.lsp.handlers")

vim.lsp.config("typos_lsp", {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
})
