local status_ok, gitsigns = pcall(require, "gitsigns");
if not status_ok then
    return;
end

gitsigns.setup({
    signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,  -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
});

vim.keymap.set("n", "<leader>gn", function() gitsigns.next_hunk() end, { desc = "Next Hunk" });
vim.keymap.set("n", "<leader>ge", function() gitsigns.prev_hunk() end, { desc = "Prev Hunk" });
vim.keymap.set("n", "<leader>gl", function() gitsigns.blame_line() end, { desc = "Blame" });
vim.keymap.set("n", "<leader>gp", function() gitsigns.preview_hunk() end, { desc = "Preview Hunk" });
vim.keymap.set("n", "<leader>gr", function() gitsigns.reset_hunk() end, { desc = "Reset Hunk" });
vim.keymap.set("n", "<leader>gR", function() gitsigns.reset_buffer() end, { desc = "Reset Buffer" });
vim.keymap.set("n", "<leader>gs", function() gitsigns.stage_hunk() end, { desc = "Stage Hunk" });
vim.keymap.set("n", "<leader>gu", function() gitsigns.undo_stage_hunk() end, { desc = "Undo Stage Hunk" });
