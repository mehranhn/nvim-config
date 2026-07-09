local status_ok, tt = pcall(require, "typescript-tools");
if not status_ok then
    return;
end

tt.setup({
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = { "add_missing_imports" },
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        tsserver_format_options = {},
        jsx_close_tag = {
            enable = true,
            filetypes = { "javascriptreact", "typescriptreact" },
        },
    },
});
