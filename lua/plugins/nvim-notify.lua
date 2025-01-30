return {
    "rcarriga/nvim-notify",
    priority = 999,
    opts = {
        -- Animation style (see below for details)
        stages = "fade_in_slide_out",

        -- Function called when a new window is opened, use for changing win settings/config
        on_open = nil,

        -- Function called when a window is closed
        on_close = nil,

        -- Render function for notifications. See notify-render()
        render = "default",

        -- Default timeout for notifications
        timeout = 5000,

        -- For stages that change opacity this is treated as the highlight behind the window
        -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
        background_colour = "#000000",

        -- Minimum width for notification windows
        minimum_width = 50,

        -- Icons for the different levels
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    },
    config = function(_, opts)
        local notify = require("notify");
        notify.setup(opts);
        vim.notify = notify;

        local status_ok, telescope = pcall(require, "telescope")
        if not status_ok then
            return
        end
        telescope.load_extension("notify")
    end,
}
