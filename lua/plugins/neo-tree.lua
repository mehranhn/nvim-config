return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "NeoTree" })

            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["e"] = "none",
                        ["o"] = "open",
                        ["?"] = "show_help",

                        ["s"] = "none",
                        ["S"] = "none",
                        ["<C-x>"] = "split_with_window_picker",
                        ["<C-v>"] = "vsplit_with_window_picker",
                    },
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                    window = {
                        mappings = {
                            ["/"] = "none",
                            ["F"] = "fuzzy_finder",
                            ["o"] = "open",
                            ["oc"] = "none",
                            ["od"] = "none",
                            ["og"] = "none",
                            ["om"] = "none",
                            ["on"] = "none",
                            ["os"] = "none",
                            ["ot"] = "none",
                            [";"] = {
                                "show_help",
                                nowait = false,
                                config = { title = "Order by", prefix_key = "o" },
                            },
                            [";c"] = { "order_by_created", nowait = false },
                            [";d"] = { "order_by_diagnostics", nowait = false },
                            [";g"] = { "order_by_git_status", nowait = false },
                            [";m"] = { "order_by_modified", nowait = false },
                            [";n"] = { "order_by_name", nowait = false },
                            [";s"] = { "order_by_size", nowait = false },
                            [";t"] = { "order_by_type", nowait = false },
                        },
                        fuzzy_finder_mappings = {
                            ["<C-n>"] = "move_cursor_down",
                            ["<C-e>"] = "move_cursor_up",
                            {
                                n = {
                                    ["n"] = "move_cursor_down",
                                    ["e"] = "move_cursor_up",
                                },
                            },
                        },
                    },
                },
                buffers = {
                    window = {
                        mappings = {
                            ["o"] = "open",
                            ["oc"] = "none",
                            ["od"] = "none",
                            ["om"] = "none",
                            ["on"] = "none",
                            ["os"] = "none",
                            ["ot"] = "none",
                            [";"] = {
                                "show_help",
                                nowait = false,
                                config = { title = "Order by", prefix_key = "o" },
                            },
                            [";c"] = { "order_by_created", nowait = false },
                            [";d"] = { "order_by_diagnostics", nowait = false },
                            [";m"] = { "order_by_modified", nowait = false },
                            [";n"] = { "order_by_name", nowait = false },
                            [";s"] = { "order_by_size", nowait = false },
                            [";t"] = { "order_by_type", nowait = false },
                        },
                    },
                },
                git_status = {
                    window = {
                        position = "float",
                        mappings = {
                            ["o"] = "open",
                            ["oc"] = "none",
                            ["od"] = "none",
                            ["om"] = "none",
                            ["on"] = "none",
                            ["os"] = "none",
                            ["ot"] = "none",
                            [";"] = {
                                "show_help",
                                nowait = false,
                                config = { title = "Order by", prefix_key = "o" },
                            },
                            [";c"] = { "order_by_created", nowait = false },
                            [";d"] = { "order_by_diagnostics", nowait = false },
                            [";m"] = { "order_by_modified", nowait = false },
                            [";n"] = { "order_by_name", nowait = false },
                            [";s"] = { "order_by_size", nowait = false },
                            [";t"] = { "order_by_type", nowait = false },
                        },
                    },
                },
            })
        end,
    },
    {
        "Crysthamus/nvim-file-operations",
        dependencies = {
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("nvim-file-operations").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
            require("window-picker").setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { "terminal", "quickfix" },
                    },
                },
            })
        end,
    },
}
