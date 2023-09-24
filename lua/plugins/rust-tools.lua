local r = require("user.lsp.servers.rust_analyzer")

return {
    "simrat39/rust-tools.nvim",
    opts = {
        tools = {
            runnables = {
                use_telescope = true,
            },
            inlay_hints = {
                --[[ auto = true, ]]
                --[[ show_parameter_hints = true, ]]
                --[[ parameter_hints_prefix = "", ]]
                --[[ other_hints_prefix = "", ]]
                --[[ highlight = "Comment", ]]
            },
        },
        server = {
            -- standalone file support
            -- setting it to false may improve startup time
            standalone = false,
            on_attach = r.on_attach,
            settings = r.settings,
        },
    },
}
