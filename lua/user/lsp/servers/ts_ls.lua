local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local status_ok = pcall(require, "jester")
local wstatus_ok, which_key = pcall(require, "which-key")
require('lspconfig').ts_ls.setup{
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        require("user.lsp.handlers").on_attach(client, bufnr)
        if status_ok then
            if not wstatus_ok then
                local opts = { noremap  = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>or", "<cmd>lua require'jester'.run()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>of", "<cmd>lua require'jester'.run_file()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ol", "<cmd>lua require'jester'.run_last()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oR", "<cmd>lua require'jester'.debug()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oF", "<cmd>lua require'jester'.debug_file()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oL", "<cmd>lua require'jester'.debug_last()<CR><CR>", opts)
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
                        name = "Jester",
                        r = {"<cmd>lua require'jester'.run()<CR>", "Jester Run Nearest Test"},
                        f = {"<cmd>lua require'jester'.run_file()<CR>", "Jester Debug File Tests"},
                        l = {"<cmd>lua require'jester'.run_last()<CR>", "Jester Run Last Test"},
                        R = {"<cmd>lua require'jester'.debug()<CR>", "Jester Debug Nearest Test"},
                        F = {"<cmd>lua require'jester'.debug_file()<CR>", "Jester Debug File Tests"},
                        L = {"<cmd>lua require'jester'.debug_last()<CR>", "Jester Debug Last Test"},
                    },
                }
                which_key.register(map, opts)
            end
        end
    end,
    capabilities = capabilities,
}
