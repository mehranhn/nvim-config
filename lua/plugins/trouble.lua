local status_ok, trouble = pcall(require, "trouble");
if not status_ok then
    return;
end

trouble.setup({
    multiline = false,
    keys = {
        l = "inspect",
        o = "jump",
        ["<cr>"] = "jump_close",
        ["<c-x>"] = "jump_split",
        f = { -- example of a custom action that toggles the active view filter
            action = function(view)
                view:filter({ buf = 0 }, { toggle = true })
            end,
            desc = "Toggle Current Buffer Filter",
        },
    },
});

vim.keymap.set("n", "<leader>nw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace Diagnostics" });
vim.keymap.set("n", "<leader>ns", "<cmd>Trouble symbols toggle<cr>", { desc = "Document Symbols" });
