return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "▏",
            -- tab_char = "▍"
        },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
            char = "▎",
        },
        exclude = {
            filetypes = {
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
            },
            buftypes = {
                "terminal",
                "nofile",
            }
        },
    },
}
