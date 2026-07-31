local status_ok, wk = pcall(require, "which-key");
if not status_ok then
    return;
end

vim.keymap.set("n", "<leader>?", function() wk.show({ global = false }) end, { desc = "Buffer Local Keymaps (which-key)" });

wk.setup({
    icons = {
        mappings = false,
    },
    spec = {
        { "<leader>a", group = "invlist" },
        { "<leader>c", group = "Buffers/Tabs" },
        { "<leader>n", group = "Lsp" },
        { "<leader>r", group = "Replace" },
        { "<leader>g", group = "Git" },
    },
});
