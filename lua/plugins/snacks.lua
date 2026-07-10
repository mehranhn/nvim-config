local status_ok, snacks = pcall(require, "snacks");
if not status_ok then
    return;
end

snacks.setup({
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        preset = {
            keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "k", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "p", desc = "Find Project", action = ":lua Snacks.picker.projects()" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                {
                    icon = " ",
                    key = "c",
                    desc = "Config",
                    action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
        },
        sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
        },
    },
    bufdelete = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = false },
    picker = {
        enabled = true,
        sources = {
            projects = {
                dev = { "~/.src", "/.files/Projects/real", "/.files/Projects/test" },
                win = {
                    input = {
                        keys = {
                            ["<c-e>"] = { "list_up", mode = { "n", "i" } },
                        },
                    },
                },
            },
        },
        win = {
            input = {
                keys = {
                    ["<c-n>"] = { "list_down", mode = { "i", "n" } },
                    ["<c-e>"] = { "list_up", mode = { "i", "n" } },
                    ["n"] = "list_down",
                    ["e"] = "list_up",
                },
            },
            list = {
                keys = {
                    ["<c-n>"] = "list_down",
                    ["<c-e>"] = "list_up",
                    ["n"] = "list_down",
                    ["e"] = "list_up",
                },
            },
        },
    },
    quickfile = { enabled = true },
    terminal = { enabled = true },
});

vim.keymap.set("n", "<leader>aA", function() Snacks.dashboard() end, { desc = "Dashboard" });

vim.keymap.set("n", "<leader>ca", function() Snacks.bufdelete.all() end, { desc = "Close All Buffers" });
vim.keymap.set("n", "<leader>cA", function() Snacks.bufdelete.other() end, { desc = "Close Other Buffers" });
vim.keymap.set("n", "<leader>cb", function() Snacks.picker.buffers() end, { desc = "Buffers" });
vim.keymap.set("n", "<leader>cc", function() Snacks.bufdelete() end, { desc = "Close Buffer" });

vim.keymap.set("n", "<leader>sb", function() Snacks.picker.git_branches() end, { desc = "Checkout Branch" });
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.colorschemes() end, { desc = "Colorscheme" });
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.git_status() end, { desc = "Checkout Branch" });
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.notifications() end, { desc = "Notification History" });
vim.keymap.set("n", "<leader>sp", function() Snacks.picker.projects() end, { desc = "Projects" });
vim.keymap.set("n", "<leader>sr", function() Snacks.picker.recent() end, { desc = "Open Recent File" });
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" });
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" });
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.files() end, { desc = "Find files" });
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.grep() end, { desc = "Find Text" });

vim.keymap.set("n", "<leader>nd", function() Snacks.picker.lsp_definitions() end, { desc = "Definition" });
vim.keymap.set("n", "<leader>ni", function() Snacks.picker.lsp_implementations() end, { desc = "Implementations" });
vim.keymap.set("n", "<leader>nr", function() Snacks.picker.lsp_references() end, { desc = "References" });
vim.keymap.set("n", "<leader>nD", function() Snacks.picker.lsp_declarations() end, { desc = "Declarations" });
vim.keymap.set("n", "<leader>nT", function() Snacks.picker.lsp_type_definitions() end, { desc = "Type Definitions" });

vim.keymap.set({ "n", "t", "i" }, "<C-t>", function() Snacks.terminal.toggle(nil, { win = { position = "float", width = 0.9, height = 0.9, border = "rounded" }}) end, { desc = "Terminal Float" });
vim.keymap.set("n", "<leader>tt", function() Snacks.terminal.toggle(nil, { win = { position = "float", width = 0.9, height = 0.9, border = "rounded" }}) end, { desc = "Terminal Float" });
vim.keymap.set("n", "<leader>tg", function() Snacks.terminal.toggle("lazygit", { win = { position = "float", width = 0.9, height = 0.9, border = "rounded" }}) end, { desc = "Lazygit" });
vim.keymap.set("n", "<leader>th", function() Snacks.terminal.toggle(nil, { win = { position = "left" }}) end, { desc = "Terminal Left" });
vim.keymap.set("n", "<leader>tn", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" }}) end, { desc = "Terminal Down" });
vim.keymap.set("n", "<leader>te", function() Snacks.terminal.toggle(nil, { win = { position = "top" }}) end, { desc = "Terminal Up" });
