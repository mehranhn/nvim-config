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
    "moll/vim-bbye",
    "akinsho/toggleterm.nvim",
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                on_config_done = nil,
                manual_mode = false,
                detection_methods = { "pattern" },
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" },
                show_hidden = false,
                silent_chdir = true,
                ignore_lsp = {},
                datapath = vim.fn.stdpath("data"),
            }
        end
    },
    "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
    "ThePrimeagen/harpoon",

    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
    "leoluz/nvim-dap-go",
};
