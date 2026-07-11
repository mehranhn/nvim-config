local status_ok, flash = pcall(require, "flash");
if not status_ok then
    return;
end

---@type Flash.Config
flash.setup({
    labels = "neiotsradhluypfwkmvcxgj",
    label = {
        uppercase = false,
        -- after = false,
        -- before = true,
    },
    modes = {
        char = {
            enabled = false,
        },
    },
});

vim.keymap.set({ "n", "x", "o" }, "f", function() flash.jump() end, { desc = "Flash" });
vim.keymap.set({ "n", "x", "o" }, "F", function() flash.treesitter() end, { desc = "Flash Treesitter" });
vim.keymap.set({ "o" }, "r", function() flash.remote() end, { desc = "Remote Flash" });
vim.keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Treesitter Search" });
