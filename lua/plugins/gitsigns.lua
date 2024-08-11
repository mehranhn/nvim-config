return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
            signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
    },
    config = function(_, opts)
        local gitsigns = require("gitsigns");
        gitsigns.setup(opts);

        local status_ok, wk = pcall(require, "which-key")
        if not status_ok then
            return
        end

        wk.add({
            { "<leader>g", group = "Git" },
            { "<leader>gn", function() gitsigns.next_hunk() end, desc = "Next Hunk" },
            { "<leader>ge", function() gitsigns.prev_hunk() end, desc = "Prev Hunk" },
            { "<leader>gl", function() gitsigns.blame_line() end, desc = "Blame" },
            { "<leader>gp", function() gitsigns.preview_hunk() end, desc = "Preview Hunk" },
            { "<leader>gr", function() gitsigns.reset_hunk() end, desc = "Reset Hunk" },
            { "<leader>gR", function() gitsigns.reset_buffer() end, desc = "Reset Buffer" },
            { "<leader>gs", function() gitsigns.stage_hunk() end, desc = "Stage Hunk" },
            { "<leader>gu", function() gitsigns.undo_stage_hunk() end, desc = "Undo Stage Hunk" },
            { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
            { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
            { "<leader>gD", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
        });
    end,
    -- opts = { 
    --     signs = { 
    --         --[[ add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" }, ]] 
    --         --[[ change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }, ]] 
    --         --[[ delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" }, ]] 
    --         --[[ topdelete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" }, ]] 
    --         --[[ changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }, ]] 
    --     }, 
    --     signcolumn = true, -- Toggle with `:Gitsigns toggle_signs` 
    --     numhl = false, -- Toggle with `:Gitsigns toggle_numhl` 
    --     linehl = false, -- Toggle with `:Gitsigns toggle_linehl` 
    --     word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff` 
    --     -- keymaps = { 
    --     --     -- Default keymap options 
    --     --     noremap = true, 
    --     -- 
    --     --     ['n ln'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"}, 
    --     --     ['n le'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"}, 
    --     -- 
    --     --     ['n <leader>ls'] = '<cmd>Gitsigns stage_hunk<CR>', 
    --     --     ['n <leader>lu'] = '<cmd>Gitsigns undo_stage_hunk<CR>', 
    --     --     ['n <leader>lr'] = '<cmd>Gitsigns reset_hunk<CR>', 
    --     --     ['n <leader>lR'] = '<cmd>Gitsigns reset_buffer<CR>', 
    --     --     ['n <leader>lp'] = '<cmd>Gitsigns preview_hunk<CR>', 
    --     --     ['n <leader>lb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', 
    --     --     ['n <leader>lS'] = '<cmd>Gitsigns stage_buffer<CR>', 
    --     --     ['n <leader>lU'] = '<cmd>Gitsigns reset_buffer_index<CR>', 
    --     -- 
    --     --     -- Text objects 
    --     --     ['o kl'] = ':<C-U>Gitsigns select_hunk<CR>', 
    --     --     ['x kl'] = ':<C-U>Gitsigns select_hunk<CR>' 
    --     -- }, 
    --     watch_gitdir = { 
    --         interval = 1000, 
    --         follow_files = true, 
    --     }, 
    --     attach_to_untracked = true, 
    --     current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame` 
    --     current_line_blame_opts = { 
    --         virt_text = true, 
    --         virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align' 
    --         delay = 1000, 
    --         ignore_whitespace = false, 
    --     }, 
    --     --[[ current_line_blame_formatter_opts = { ]] 
    --     --[[     relative_time = false, ]] 
    --     --[[ }, ]] 
    --     sign_priority = 6, 
    --     update_debounce = 100, 
    --     status_formatter = nil, 
    --     max_file_length = 40000, 
    --     preview_config = { 
    --         border = "single", 
    --         style = "minimal", 
    --         relative = "cursor", 
    --         row = 0, 
    --         col = 1, 
    --     }, 
    --     --[[ yadm = { ]] 
    --     --[[     enable = false, ]] 
    --     --[[ }, ]] 
    -- } 
}
