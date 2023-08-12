local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local status_ok = pcall(require, "rust-tools")
local wstatus_ok, which_key = pcall(require, "which-key")

local M = {}

M.capabilities = capabilities

M.on_attach = function(client, bufnr)
    require("user.lsp.handlers").on_attach(client, bufnr)
    if status_ok then
        if not wstatus_ok then
            local opts = { noremap  = true, silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oH", "<cmd>RustToggleInlayHints<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>or", "<cmd>RustRunnables<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oe", "<cmd>RustMoveItemUp<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>on", "<cmd>RustMoveItemDown<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oh", "<cmd>RustHoverActions<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oo", "<cmd>RustParentModule", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oj", "<cmd>RustJoinLines<CR><CR>", opts)
        else
            local opts = {
                mode = "n", -- NORMAL mode
                prefix = "<leader>",
                buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }
            local map = {
                o = {
                    name = "Rust Tools",
                    H = {"<cmd>RustToggleInlayHints<CR>", "Toggle Inline Hints"},
                    r = {"<cmd>RustRunnables<CR>", "Runnables"},
                    e = {"<cmd>RustMoveItemUp<CR>", "Mobe Item Up"},
                    n = {"<cmd>RustMoveItemDown<CR>", "Move Item Down"},
                    h = {"<cmd>RustHoverActions<CR>", "Hover Actions"},
                    o = {"<cmd>RustParentModule<CR>", "Parent Module"},
                    j = {"<cmd>RustJoinLines<CR>", "Join Lines"},
                },
            }
            which_key.register(map, opts)
        end
    end
end

M.settings = {
    ["rust-analyzer"] = {
        cargo = {
            buildScripts = {
                enable = true,
            },
        },
        procMacro = {
            enable = true,
            attributes = {
                enable = true
            },
            ignored = {
                ["async_trait"] = {"async_trait"},
            },
        },
    }
}

M.setup = function ()
    require('lspconfig').rust_analyzer.setup{
        on_attach = M.on_attach,
        capabilities = capabilities,
        settings = M.settings
    }
end

return M
