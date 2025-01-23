return {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-dap.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local actions = require("telescope.actions");
            local telescope = require("telescope");
            local builtin = require('telescope.builtin');
            local themes = require('telescope.themes');

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },

                    mappings = {
                        i = {
                            ["<C-f>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,

                            ["<C-n>"] = actions.move_selection_next,
                            ["<C-e>"] = actions.move_selection_previous,

                            ["<C-c>"] = actions.close,

                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,

                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,

                            ["<C-l>"] = actions.preview_scrolling_up,
                            ["<C-u>"] = actions.preview_scrolling_down,

                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,

                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-y>"] = actions.complete_tag,
                            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                        },

                        n = {
                            ["<esc>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,

                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                            ["n"] = actions.move_selection_next,
                            ["e"] = actions.move_selection_previous,
                            ["N"] = actions.move_to_top,
                            ["M"] = actions.move_to_middle,
                            ["E"] = actions.move_to_bottom,

                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["gg"] = actions.move_to_top,
                            ["G"] = actions.move_to_bottom,

                            ["<C-l>"] = actions.preview_scrolling_up,
                            ["<C-u>"] = actions.preview_scrolling_down,

                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,

                            ["?"] = actions.which_key,
                        },
                    },
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --     picker_config_key = value,
                    --     ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --     extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                    },
                    project = {
                        base_dirs = {
                            {'~/.src/', max_depth = 2},
                            {'/.files/Projects', max_depth = 4},
                        },
                    },
                    media_files = {
                        -- filetypes whitelist
                        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                        filetypes = {"png", "webp", "jpg", "jpeg"},
                        find_cmd = "rg" -- find command (defaults to `fd`)
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                          -- even more opts
                        }
                    }
                },
            });

            telescope.load_extension('ui-select');
            telescope.load_extension('fzf');
            telescope.load_extension('projects');
            telescope.load_extension('project');
            telescope.load_extension('media_files');
            telescope.load_extension('harpoon');
            telescope.load_extension('dap');

            local status_ok, wk = pcall(require, "which-key")
            if not status_ok then
                return
            end

            wk.add({
                { "<leader>s", group = "Search" },
                { "<leader>sb", builtin.git_branches, desc = "Checkout Branch" },
                { "<leader>sc", builtin.colorscheme, desc = "Colorscheme" },
                { "<leader>sh", "<cmd>Telescope notify<cr>", desc = "Notification History" },
                { "<leader>sH", builtin.help_tags, desc = "Find Help" },
                { "<leader>sm", telescope.extensions.media_files.media_files, desc = "Media Files" },
                { "<leader>sM", builtin.man_pages, desc = "Man Pages" },
                { "<leader>se", "<cmd>Telescope emoji<cr>", desc = "Emoji" },
                { "<leader>sp", telescope.extensions.project.project, desc = "Projects" },
                { "<leader>sr", builtin.oldfiles, desc = "Open Recent File" },
                { "<leader>sR", builtin.registers, desc = "Registers" },
                { "<leader>sk", builtin.keymaps, desc = "Keymaps" },
                { "<leader>sC", builtin.commands, desc = "Commands" },
                { "<leader>si", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon Marks" },
                { "<leader>ss", function () builtin.find_files(themes.get_dropdown{previewer = false}) end, desc = "Find files" },
                { "<leader>sS", builtin.live_grep, desc = "Find Text" },
                { "<leader>sf", builtin.filetypes, desc = "File Types" },
            });
        end,
    },
}
