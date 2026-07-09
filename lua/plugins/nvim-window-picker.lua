local status_ok, wp = pcall(require, "window-picker");
if not status_ok then
    return;
end

wp.setup({
    selection_chars = "neiotsradhluypfwkmvcxgj",
    filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
        },
    },
})
