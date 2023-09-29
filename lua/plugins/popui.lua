return {
    "hood/popui.nvim",
    enabled = false,
    dependencies = {"RishabhRD/popfix"},
    config = function()
        vim.ui.select = require"popui.ui-overrider"
        vim.g.popui_border_style = "rounded"
    end,
}
