local handlers = require("user.lsp.handlers")

vim.lsp.config("buf_ls", {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
})
