local status_ok, conf = pcall(require, "dial.config");
if not status_ok then
    return;
end

local augend = require("dial.augend");
local map = require("dial.map");

conf.augends:register_group({
    -- default augends used when no group name is specified
    default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
    },
    typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new({ elements = { "let", "const" } }),
    },
});

vim.keymap.set("n", "<C-a>", function() map.manipulate("increment", "normal") end, { desc = "Increment number" });
vim.keymap.set("n", "<C-r>", function() map.manipulate("decrement", "normal") end, { desc = "Decrement number" });
vim.keymap.set("x", "<C-a>", function() map.manipulate("increment", "visual") end, { desc = "Increment number" });
vim.keymap.set("x", "<C-r>", function() map.manipulate("decrement", "visual") end, { desc = "Decrement number" });
vim.keymap.set("x", "g<C-a>", function() map.manipulate("increment", "gvisual") end, { desc = "Increment number (global)" });
vim.keymap.set("x", "g<C-r>", function() map.manipulate("decrement", "gvisual") end, { desc = "Decrement number (global)" });
