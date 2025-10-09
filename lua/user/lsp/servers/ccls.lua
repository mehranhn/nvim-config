local handlers = require("user.lsp.handlers")

vim.lsp.config("ccls", {
    capabilities = handlers.capabilities(),
    on_attach = handlers.on_attach,
    init_options = {
        cache = {
            directory = "/tmp/ccls",
        },
        compilationDatabaseDirectory = "build",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math" },
        },
    }
})
