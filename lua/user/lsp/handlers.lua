local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.INFO] = "",
                [vim.diagnostic.severity.HINT] = "",
            },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

-- local function lsp_highlight_document(client)
--     -- Set autocommands conditional on server_capabilities
--     if client.server_capabilities.document_highlight then
--         vim.api.nvim_exec2(
--             [[
--                 augroup lsp_document_highlight
--                 autocmd! * <buffer>
--                 autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--                 autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--                 augroup END
--             ]],
--             { output = false }
--         )
--     end
-- end
--
-- local function lsp_keymaps(bufnr)
--     local status_ok, which_key = pcall(require, "which-key")
--     if not status_ok then
--         local opts = { noremap = true, silent = true }
--
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>TroubleToggle lsp_implementations<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--         -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--         -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
--         vim.api.nvim_buf_set_keymap(
--             bufnr,
--             "n",
--             "gl",
--             '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
--             opts
--         )
--         -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
--         -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--         -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
--     else
--         which_key.add({
--             { "gD", function() vim.lsp.buf.declaration() end,                                        buffer = bufnr, desc = "Declaration" },
--             { "gd", "<cmd>TroubleToggle lsp_definitions<CR>",                                        buffer = bufnr, desc = "Definitions" },
--             { "gh", function() vim.lsp.buf.hover() end,                                              buffer = bufnr, desc = "Hover" },
--             { "gi", "<cmd>TroubleToggle lsp_implementations<CR>",                                    buffer = bufnr, desc = "Implementations" },
--             { "gH", function() vim.lsp.buf.signature_help() end,                                     buffer = bufnr, desc = "Signature Help" },
--             { "gr", "<cmd>TroubleToggle lsp_implementations<CR>",                                    buffer = bufnr, desc = "Implementations" },
--             { "gl", function() vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' }) end, buffer = bufnr, desc = "Line Diagnostics" },
--             { "gR", function() vim.lsp.buf.rename() end,                                             buffer = bufnr, desc = "Rename" },
--             { "ga", "<cmd>TroubleToggle loclist<CR>",                                                buffer = bufnr, desc = "Code Actions" },
--             { "gA", "<cmd>TroubleToggle quickfix<CR>",                                               buffer = bufnr, desc = "Quickfix" },
--         });
--     end
-- end

M.on_attach = function(client, bufnr)
    -- lsp_keymaps(bufnr)
    -- lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    return cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
