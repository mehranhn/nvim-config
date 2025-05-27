return {
    "monaqa/dial.nvim",
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
    config = function()
        local augend = require("dial.augend")
        local conf = require("dial.config")
        local map = require("dial.map")

        conf.augends:register_group {
            -- default augends used when no group name is specified
            default = {
                augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.hex,  -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
            },
            typescript = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.constant.new { elements = { "let", "const" } },
            },
        }

        vim.api.nvim_set_keymap("n", "<C-a>", map.inc_normal(), { noremap = true })
        vim.api.nvim_set_keymap("n", "<C-r>", map.dec_normal(), { noremap = true })
        vim.api.nvim_set_keymap("v", "<C-a>", map.inc_visual(), { noremap = true })
        vim.api.nvim_set_keymap("v", "<C-r>", map.dec_visual(), { noremap = true })
        vim.api.nvim_set_keymap("v", "g<C-a>", map.inc_gvisual(), { noremap = true })
        vim.api.nvim_set_keymap("v", "g<C-r>", map.dec_gvisual(), { noremap = true })
    end
}
