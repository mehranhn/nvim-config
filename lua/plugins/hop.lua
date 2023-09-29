return {
    "phaazon/hop.nvim",
    opts = {
        keys = "neiotsradhluypfwkmvcxgj"
        -- keys = "etovxqpdygfblzhckisuran
    },
    config = function(_, opts)
        vim.api.nvim_set_keymap('', 'f', "<cmd>lua require('hop').hint_char1()<cr>", {})
        -- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require('hop').hint_lines()<cr>", {})
        -- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require('hop').hint_words({ inclusive_jump = true })<cr>", {})
        vim.api.nvim_set_keymap('', 'T', "<cmd>lua require('hop').hint_words()<cr>", {})
        vim.api.nvim_set_keymap('', 's', "<cmd>lua require('hop').hint_words({ current_line_only = true })<cr>", {})
        -- vim.api.nvim_set_keymap('', 's', "<cmd>lua require('hop').hint_char1({ current_line_only = true })<cr>", {})
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup(opts)
    end
}
