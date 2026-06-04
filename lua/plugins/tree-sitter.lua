return {
    {
        "romus204/tree-sitter-manager.nvim",
        dependencies = {},
        config = function()
            require("tree-sitter-manager").setup({
              -- Default Options
              -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session. If set to "all", install all parsers.
              ensure_installed = { "angular", "arduino", "asm", "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "cuda", "dart", "desktop", "diff", "disassembly", "dockerfile", "ecma", "editorconfig", "fish", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "gomod", "gosum", "gpg", "haskell", "hlsl", "html", "html_tags", "http", "hurl", "hyprlang", "ini", "java", "javascript", "jq", "jsdoc", "json", "json5", "jsx", "kotlin", "latex", "llvm", "lua", "luadoc", "luau", "make", "markdown", "markdown_inline", "meson", "nginx", "ninja", "odin", "passwd", "powershell", "printf", "prisma", "proto", "python", "r", "regex", "ron", "rust", "scss", "slint", "solidity", "sql", "ssh_config", "svelte", "sway", "swift", "tmux", "toml", "tsv", "tsx", "typescript", "udev", "vala", "vim", "vimdoc", "vue", "wgsl", "wgsl_bevy", "yaml", "yuck", "zathurarc", "zig", "ziggy", "ziggy_schema", "zsh" },
              -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
              -- auto_install = false, -- if enabled, install missing parsers when editing a new file
              -- highlight = true, -- treesitter highlighting is enabled by default
              -- languages = {}, -- override or add new parser sources
            })
            -- vim.api.nvim_create_autocmd('FileType', {
            --     pattern = { "rust", "typescript" },
            --     callback = function(args)
            --         vim.treesitter.start(args.buf)
            --         vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            --         vim.wo.foldmethod = 'expr'
            --         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            --     end,
            -- })
        end
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
        "mizlan/iswap.nvim",
        event = "VeryLazy",
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
}
