local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = {}

M.capabilities = capabilities

M.on_attach = function(client, bufnr)
    require("user.lsp.handlers").on_attach(client, bufnr)
    vim.lsp.codelens.refresh()
    local group = vim.api.nvim_create_augroup("RustCodeLens", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
    })
end

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
        lens = {
            enable = true,
            location = "above_name",
            references = {
                adt = {
                    enable = true
                },
                method = {
                    enable = true
                },
                trait = {
                    enable = true
                },
            },
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
