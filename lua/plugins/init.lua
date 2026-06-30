return {
    -- My plugins here
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    {
        "tiagovla/scope.nvim",
        opts = {},
        config = function (_, opts)
            vim.opt.sessionoptions = { -- required
                "buffers",
                "tabpages",
                "globals",
            }
            require("scope").setup(opts)
        end
    },
    "leoluz/nvim-dap-go",
};
