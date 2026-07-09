local status_ok, comment = pcall(require, "Comment")
local status_ok_ts, ts_comment = pcall(require, "ts_context_commentstring")
local status_ok_tsi, tsi_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not status_ok or not status_ok_ts or not status_ok_tsi then
    return
end

ts_comment.setup({
    enable_autocmd = false,
})

comment.setup({
    pre_hook = tsi_comment.create_pre_hook(),
})
