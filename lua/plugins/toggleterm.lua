function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<A-w>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<A-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<A-n>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<A-e>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<A-i>', [[<C-\><C-n><C-W>l]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<A-q>', [[<C-\><C-n><C-W>q]], opts)
end

return {
    "akinsho/toggleterm.nvim",
    opts = {
        size = 20,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        -- shell = "tmux",
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    },
    config = function(_, opt)
        require('toggleterm').setup(opt);

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        local htop = Terminal:new({ cmd = "htop", hidden = true })
        local btop = Terminal:new({ cmd = "btop", hidden = true })

        local status_ok, wk = pcall(require, "which-key")
        if not status_ok then
            return
        end

        wk.add({
            { "<leader>t", group = "Terminal" },
            { "<leader>tg", function() lazygit:toggle() end, desc = "Lazygit" },
            { "<leader>th", function() htop:toggle() end, desc = "Htop" },
            { "<leader>tb", function() btop:toggle() end, desc = "Btop" },
            { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Float" },
            { "<leader>tx", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
            { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
        });
    end,
}
