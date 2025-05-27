local r = require("user.lsp.servers.rust_analyzer")
local wstatus_ok, which_key = pcall(require, "which-key")

local on_attach = function(client, bufnr)
    r.on_attach(client, bufnr)
    if not wstatus_ok then
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>or", "<cmd>lua vim.cmd.RustLsp('run')<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oR", "<cmd>lua vim.cmd.RustLsp('runnables')<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ot", "<cmd>lua vim.cmd.RustLsp('testables')<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oM", "<cmd>lua vim.cmd.RustLsp('expandMacro')<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oa", "<cmd>lua vim.cmd.RustLsp('codeAction')<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>od", "<cmd>lua vim.cmd.RustLsp('joinLines')<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ok", "<cmd>lua vim.cmd.RustLsp { 'view', 'mir' }<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oK", "<cmd>lua vim.cmd.RustLsp { 'view', 'hir' }<CR>", opts)
    else
        which_key.add({
            { "or", function() vim.cmd.RustLsp('run') end,            buffer = bufnr, desc = "Run" },
            { "oR", function() vim.cmd.RustLsp('runnables') end,      buffer = bufnr, desc = "Runnables" },
            { "ot", function() vim.cmd.RustLsp('testables') end,      buffer = bufnr, desc = "Testables" },
            { "oM", function() vim.cmd.RustLsp('expandMacro') end,    buffer = bufnr, desc = "Expand Macro" },
            { "oa", function() vim.cmd.RustLsp('codeAction') end,     buffer = bufnr, desc = "Code Action" },
            { "od", function() vim.cmd.RustLsp('joinLines') end,      buffer = bufnr, desc = "Join Lines" },
            { "ok", function() vim.cmd.RustLsp { 'view', 'mir' } end, buffer = bufnr, desc = "View MIR" },
            { "oK", function() vim.cmd.RustLsp { 'view', 'hir' } end, buffer = bufnr, desc = "View HIR" },
        })
    end
end

return {
    "mrcjkb/rustaceanvim",
    version = '^6',
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {
            -- Plugin configuration
            tools = {
                runnables = {
                    use_telescope = true,
                },
                inlay_hints = {
                    --[[ auto = true, ]]
                    --[[ show_parameter_hints = true, ]]
                    --[[ parameter_hints_prefix = "", ]]
                    --[[ other_hints_prefix = "", ]]
                    --[[ highlight = "Comment", ]]
                },
            },
            -- LSP configuration
            server = {
                -- standalone file support
                -- setting it to false may improve startup time
                standalone = false,
                on_attach = on_attach,
                default_settings = r.settings,
            },
        }
    end,
}
