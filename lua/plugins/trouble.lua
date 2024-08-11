return {
    "folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        multiline = false,
        keys = {
            l = "inspect",
            o = "jump",
            ["<cr>"] = "jump_close",
            ["<c-x>"] = "jump_split",
            f = { -- example of a custom action that toggles the active view filter
                action = function(view)
                    view:filter({ buf = 0 }, { toggle = true })
                end,
                desc = "Toggle Current Buffer Filter",
            },
        },
    },
    config = function (_, opts)
        local trouble = require("trouble");
        trouble.setup(opts);

        local status_ok, wk = pcall(require, "which-key")
        if not status_ok then
            return
        end

        wk.add({
            { "<leader>nw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
            { "<leader>ns", "<cmd>Trouble symbols toggle<cr>", desc = "Document Symbols" },
        });
    end,
}
        --[[ position = "right", -- position of the list can be: bottom, top, left, right ]]
        --[[ height = 10, -- height of the trouble list when position is top or bottom ]]
        --[[ width = 50, -- width of the list when position is left or right ]]
        --[[ mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist" ]]
        --[[ fold_open = "", -- icon used for open folds ]]
        --[[ fold_closed = "", -- icon used for closed folds ]]
        --[[ group = true, -- group results by file ]]
        --[[ padding = true, -- add an extra new line on top of the list ]]
        --[[ indent_lines = true, -- add an indent guide below the fold icons ]]
        --[[ auto_fold = false, -- automatically fold a file trouble list at creation ]]
        --[[ auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result ]]
        --[[ modes = { ]]
        --[[     mydiags = { ]]
        --[[       mode = "diagnostics", -- inherit from diagnostics mode ]]
        --[[       filter = { ]]
        --[[         any = { ]]
        --[[           buf = 0, -- current buffer ]]
        --[[           { ]]
        --[[             severity = vim.diagnostic.severity.WARN, -- errors only ]]
        --[[             -- limit to files in the current project ]]
        --[[             function(item) ]]
        --[[               return item.filename:find((vim.loop or vim.uv).cwd(), 1, true) ]]
        --[[             end, ]]
        --[[           }, ]]
        --[[         }, ]]
        --[[       }, ]]
        --[[     } ]]
        --[[ }, ]]
        --[[ signs = { ]]
        --[[     -- icons / text used for a diagnostic ]]
        --[[     error = "󰅚", ]]
        --[[     warning = "", ]]
        --[[     hint = "", ]]
        --[[     information = "", ]]
        --[[     other = "﫠" ]]
        --[[ }, ]]
        --[[ use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client ]]
