local prettier_filetypes = {
    "javascript", "javascriptreact", "typescript", "typescriptreact",
    "vue", "css", "scss", "less", "html", "json", "yaml",
    "markdown", "graphql", "handlebars"
}

local formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    go = { "goimports", "gofmt" }, -- or "golines", "goimports-reviser"
    python = { "black", "isort" }, -- or "ruff", "autopep8", "yapf"
}
for _, ft in ipairs(prettier_filetypes) do
    formatters_by_ft[ft] = { "prettierd", "prettier", stop_after_first = true }
end

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = formatters_by_ft,
        default_format_opts = {
            lsp_format = "last",
        },
    }
}
