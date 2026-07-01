return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset =  {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "k", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "p", desc = "Find Project", action = ":lua Snacks.picker.projects()" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
            },
            bufdelete = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            picker = {
                enabled = true,
                sources = {
                    projects = {
                        dev = { "~/.src", "/.files/Projects/real", "/.files/Projects/test" },
                        win = {
                            input = {
                                keys = {
                                    ["<c-e>"] = { "list_up", mode = { "n", "i" } },
                                }
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
        },
        keys = {
            { "<leader>aA", function() Snacks.dashboard() end, desc = "Dashboard" },

            { "<leader>ca", function() Snacks.bufdelete.all() end, desc = "Close All Buffers" },
            { "<leader>cA", function() Snacks.bufdelete.other() end, desc = "Close All Buffers" },
            { "<leader>cb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>cc", function() Snacks.bufdelete() end, desc = "Close Buffer" },

            { "<leader>sb", function() Snacks.picker.git_branches() end, desc = "Checkout Branch" },
            { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "Colorscheme" },
            { "<leader>sd", function() Snacks.picker.git_status() end, desc = "Checkout Branch" },
            { "<leader>sh", function() Snacks.picker.notifications() end, desc = "Notification History" },
            { "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
            { "<leader>sr", function() Snacks.picker.recent() end, desc = "Open Recent File" },
            { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
            { "<leader>ss", function() Snacks.picker.files() end, desc = "Find files" },
            { "<leader>sS", function() Snacks.picker.grep() end, desc = "Find Text" },

            { "<leader>nd", function() Snacks.picker.lsp_definitions() end, desc = "Definition" },
            { "<leader>ni", function() Snacks.picker.lsp_implementations() end, desc = "Implementations" },
            { "<leader>nr", function() Snacks.picker.lsp_references() end, desc = "References" },
            { "<leader>nD", function() Snacks.picker.lsp_declarations() end, desc = "Declarations" },
            { "<leader>nT", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definitions" },

            { "<C-t>", function() Snacks.terminal.toggle(nil, { win = { position = "float", width = 0.9, height = 0.9, border = "rounded" }}) end, desc = "Terminal Float", mode = { "n", "t", "i" } },
            { "<C-d>", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" }}) end, desc = "Terminal Bottom", mode = { "n", "t", "i" } },
            { "<leader>tt", function() Snacks.terminal.toggle(nil, { win = { position = "float", width = 0.9, height = 0.9, border = "rounded" }}) end, desc = "Terminal Float" },
            { "<leader>tg", function() Snacks.terminal.toggle("lazygit", { win = { position = "float", width = 0.9, height = 0.9, border = "rounded" }}) end, desc = "Lazygit" },
            { "<leader>th", function() Snacks.terminal.toggle(nil, { win = { position = "left" }}) end, desc = "Terminal Left" },
            { "<leader>tn", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" }}) end, desc = "Terminal Down" },
            { "<leader>te", function() Snacks.terminal.toggle(nil, { win = { position = "top" }}) end, desc = "Terminal Up" },
            { "<leader>ti", function() Snacks.terminal.toggle(nil, { win = { position = "right" }}) end, desc = "Terminal Right" },
        }
    },
}
