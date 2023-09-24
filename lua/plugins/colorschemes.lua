return {
    {
        "Mofiqul/vscode.nvim",
        prio = 1000,
        opts = {
            -- Alternatively set style in setup
            style = 'dark',

            -- Enable transparent background
            transparent = false,

            -- Enable italic comment
            italic_comments = false,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                --[[ vscLineNumber = '#FFFFFF', ]]
            },

            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                --[[ Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true }, ]]
            }
        },
        config = function(_, opts)
            require('vscode').setup(opts)
            require('vscode').load()
        end,
    },
    "haishanh/night-owl.vim",
    "EdenEast/nightfox.nvim",
    "sainnhe/sonokai",
    "folke/tokyonight.nvim",
    { 'rose-pine/neovim', name = 'rose-pine' },
    "rebelot/kanagawa.nvim",
    "rafamadriz/neon",
    {"marko-cerovac/material.nvim", opts = {}},
    "dracula/vim",
    "joshdick/onedark.vim",
    { "bluz71/vim-nightfly-colors", name = "nightfly" },
}

-- tokyonight
-- vim.g.tokyonight_style = "night"

-- rose_pine
-- vim.g.rose_pine_variant = "main"

-- vscode
-- vim.g.vscode_style = "dark"
-- vim.g.vscode_italic_comment = 1

-- neon
-- vim.g.neon_style = "doom"

-- material
-- local status_ok, material = pcall(require, "material")
-- if status_ok then
    -- material.setup()
-- end
-- vim.g.material_style = "darker"

-- vim.cmd [[
    -- try
    -- colorscheme vscode
    -- catch /^Vim\%((\a\+)\)\=:E185/
    -- colorscheme default
    -- set background=dark
    -- endtry
-- ]]

