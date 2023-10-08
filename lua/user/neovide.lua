if vim.g.neovide then
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_vfx_mode = "railgun"

    vim.o.guifont = "monospace:h11.5"
    -- vim.o.guifont = "Hack Nerd Font:h8"
    -- vim.o.guifont = "Iosevka:h8"
    -- vim.o.guifont = "Fira Code:h7"

    -- vim.g.neovide_transparency = 0.8
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_vfx_mode = "torpedo"

    -- keymaps
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<c-s-c>", "\"+y", opts)
    vim.api.nvim_set_keymap("v", "<c-s-c>", "\"+y", opts)
    vim.api.nvim_set_keymap("n", "<c-s-v>", "\"+p", opts)
    vim.api.nvim_set_keymap("i", "<c-s-v>", "<c-r>+", opts)
    vim.api.nvim_set_keymap("c", "<c-s-v>", "<c-r>+", opts)
    --[[ vim.api.nvim_set_keymap("i", "<c-r>", "<c-v>", opts) ]]
end
