local status_ok, neotree = pcall(require, "neo-tree");
if not status_ok then
    return;
end

neotree.setup({
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
                ["f"] = "none",
                ["F"] = "fuzzy_finder",
                ["o"] = "open_with_window_picker",
                ["<cr>"] = "open_with_window_picker",
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
                ["o"] = "open_with_window_picker",
                ["<cr>"] = "open_with_window_picker",
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
                ["o"] = "open_with_window_picker",
                ["<cr>"] = "open_with_window_picker",
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
});

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle filesystem toggle reveal_force_cwd<CR>", { desc = "NeoTree" });
