return {
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
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
    {"haishanh/night-owl.vim", lazy = true},
    {"EdenEast/nightfox.nvim", lazy = true},
    {"sainnhe/sonokai", lazy = true},
    {"folke/tokyonight.nvim", lazy = true},
    {"rose-pine/neovim", name = "rose-pine", lazy = true},
    {"rebelot/kanagawa.nvim", lazy = true},
    {"rafamadriz/neon", lazy = true},
    {"marko-cerovac/material.nvim", opts = {}, lazy = true},
    {"dracula/vim", lazy = true},
    {"joshdick/onedark.vim", lazy = true},
    {"bluz71/vim-nightfly-colors", name = "nightfly", lazy = true},
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

