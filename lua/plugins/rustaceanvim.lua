local r = require("user.lsp.servers.rust_analyzer")

local on_attach = function(client, bufnr)
    r.on_attach(client, bufnr)
    vim.keymap.set("n", "<leader>or", function() vim.cmd.RustLsp('run') end, { buf = bufnr, desc = "Run" });
    vim.keymap.set("n", "<leader>oR", function() vim.cmd.RustLsp('runnables') end, { buf = bufnr, desc = "Runnables" });
    vim.keymap.set("n", "<leader>ot", function() vim.cmd.RustLsp('testables') end, { buf = bufnr, desc = "Testables" });
    vim.keymap.set("n", "<leader>oM", function() vim.cmd.RustLsp('expandMacro') end, { buf = bufnr, desc = "Expand macro" });
    vim.keymap.set("n", "<leader>oa", function() vim.cmd.RustLsp('codeAction') end, { buf = bufnr, desc = "Code action" });
    vim.keymap.set("n", "<leader>od", function() vim.cmd.RustLsp('joinLines') end, { buf = bufnr, desc = "Join lines" });
    vim.keymap.set("n", "<leader>ok", function() vim.cmd.RustLsp { 'view', 'mir' } end, { buf = bufnr, desc = "View mir" });
    vim.keymap.set("n", "<leader>oK", function() vim.cmd.RustLsp { 'view', 'hir' } end, { buf = bufnr, desc = "View hir" });
    vim.keymap.set("n", "<leader>oD", function() vim.cmd.RustLsp { 'openDocs' } end, { buf = bufnr, desc = "Open docs" });
    vim.keymap.set("n", "<leader>oh", function() vim.cmd.RustLsp { 'parentModule' } end, { buf = bufnr, desc = "Parent module" });
    vim.keymap.set("n", "<leader>of", function() vim.cmd.RustLsp { 'flyCheck', 'run' } end, { buf = bufnr, desc = "flyCheck run" });
    vim.keymap.set("n", "<leader>oF", function() vim.cmd.RustLsp { 'flyCheck', 'clear' } end, { buf = bufnr, desc = "flyCheck clear" });
    vim.keymap.set("n", "<leader>oQ", function() vim.cmd.RustAnalyzer { 'restart' } end, { buf = bufnr, desc = "Restart" });
    vim.keymap.set("n", "<leader>o1", function() vim.cmd.RustAnalyzer { 'config', '{ check = { command = \"check\" } }' } end, { buf = bufnr, desc = "Check command: check" });
    vim.keymap.set(bufnr, "n", "<leader>o2", function() vim.cmd.RustAnalyzer { 'config', '{ check = { command = \"clippy\" } }' } end, { buf = bufnr, desc = "Check command: clippy" });
end

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
        runnables = {
            use_telescope = false,
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
        settings = r.settings,
    },
};
