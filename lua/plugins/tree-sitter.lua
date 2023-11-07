return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function ()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                modules = {},
                auto_install = true,
                ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
                ignore_install = { "" }, -- List of parsers to ignore installing
                autopairs = {
                    enable = true,
                },
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true, disable = { "yaml" } },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gd",
                        node_incremental = "gn",
                        scope_incremental = "gh",
                        node_decremental = "ge",
                    },
                },
                autotag = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    colors = {
                        "Gold",
                        "Orchid",
                        "DodgerBlue",
                        -- "Cornsilk",
                        -- "Salmon",
                        -- "LawnGreen",
                    },
                    disable = { "html", "jsx" },
                },
            })
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                -- Note that setting an entry here replaces all other patterns for this entry.
                -- By setting the 'default' entry below, you can control which nodes you want to
                -- appear in the context window.
                default = {
                    'class',
                    'function',
                    'method',
                    --[[ 'for', ]]
                    --[[ 'while', ]]
                    --[[ 'if', ]]
                    --[[ 'switch', ]]
                    --[[ 'case', ]]
                },
                -- Patterns for specific filetypes
                -- If a pattern is missing, *open a PR* so everyone can benefit.
                tex = {
                    'chapter',
                    'section',
                    'subsection',
                    'subsubsection',
                },
                rust = {
                    'impl_item',
                    'struct',
                    'enum',
                },
                scala = {
                    'object_definition',
                },
                vhdl = {
                    'process_statement',
                    'architecture_body',
                    'entity_declaration',
                },
                markdown = {
                    'section',
                },
                elixir = {
                    'anonymous_function',
                    'arguments',
                    'block',
                    'do_block',
                    'list',
                    'map',
                    'tuple',
                    'quoted_content',
                },
                json = {
                    'pair',
                },
                yaml = {
                    'block_mapping_pair',
                },
            },
            exact_patterns = {
                -- Example for a specific filetype with Lua patterns
                -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
                -- exactly match "impl_item" only)
                -- rust = true,
            },

            -- [!] The options below are exposed but shouldn't require your attention,
            --     you can safely ignore them.

            zindex = 20, -- The Z-index of the context window
            mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
        }
    },
    {
        "windwp/nvim-ts-autotag",
    },
    {
        "p00f/nvim-ts-rainbow",
        enabled = false,
    },
    {
        "mizlan/iswap.nvim",
        opts = {
            -- The keys that will be used as a selection, in order
            -- ('asdfghjklqwertyuiopzxcvbnm' by default)
            keys = 'neiotsradhplfuwyqgjvkcmx,z.b',

            -- Grey out the rest of the text when making a selection
            -- (enabled by default)
            grey = 'disable',

            -- Highlight group for the sniping value (asdf etc.)
            -- default 'Search'
            -- hl_snipe = 'ErrorMsg',

            -- Highlight group for the visual selection of terms
            -- default 'Visual'
            -- hl_selection = 'WarningMsg',

            -- Highlight group for the greyed background
            -- default 'Comment'
            -- hl_grey = 'LineNr',

            -- Automatically swap with only two arguments
            -- default nil
            -- autoswap = true
        },
    },
    {
        "lewis6991/spellsitter.nvim",
        enabled = false,
    },
}
