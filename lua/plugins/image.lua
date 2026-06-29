return {
    "3rd/image.nvim",
    build = false,
    dependencies = {
        "nvim-neo-tree/neo-tree.nvim",
    },
    opts = {
        backend = "sixel",
        processor = "magick_cli",
    },
}
