return {
    "folke/which-key.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons",
    },
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    opts = {
        icons = {
            mappings = false,
        },
        spec = {
            { "<leader>A", "<cmd>Alpha<cr>", desc = "Alpha" },
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
            { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
            { "<leader>q", "<cmd>q!<cr>", desc = "Quit" },
            { "<leader>h", "<cmd>nohlsearch<cr>", desc = "No Highlight" },
            { "<leader>u", "<cmd>Lazi<cr>", desc = "Lazy" },

            { "<leader>a", group = "invlist" },
            { "<leader>aa", "<cmd>set invlist<cr>", desc = "Toggle List Mode" },
            { "<leader>as", "<cmd>set spell!<cr>", desc = "Toggle Spell Mode" },

            { "<leader>c", group = "Buffers/Tabs" },
            { "<leader>ca", "<cmd>bufdo Bdelete<CR>", desc = "Close All Buffers" },
            { "<leader>cb", function() require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false}) end, desc = "Buffers" },
            { "<leader>cc", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
            { "<leader>cv", "<cmd>vsp<CR>", desc = "Split Vertically" },
            { "<leader>cx", "<cmd>sp<CR>", desc = "Split Horizontally" },
            { "<leader>ct", "<cmd>tabnew<CR>", desc = "New Tab" },
            { "<leader>cn", "<cmd>tabnext<CR>", desc = "Next Tab" },
            { "<leader>ce", "<cmd>tabprevious<CR>", desc = "Previous Tab" },
            { "<leader>cd", "<cmd>tabclose<CR>", desc = "Close Tab" },

            { "<leader>i", group = "Harpoon" },
            { "<leader>ii", function() require('harpoon.mark').toggle_file(0) end, desc = "Toggle file" },
            { "<leader>in", function() require('harpoon.ui').nav_next() end, desc = "Next" },
            { "<leader>ie", function() require('harpoon.ui').nav_prev() end, desc = "Previous" },
            { "<leader>iM", function() require('harpoon.ui').toggle_quick_menu() end, desc = "Menu" },
            { "<leader>im", "<cmd>Telescope harpoon marks<CR>", desc = "Menu (Telescope)" },

            { "<leader>n", group = "Lsp" },
            { "<leader>nf", function() vim.lsp.buf.format() end, desc = "Format" },
            { "<leader>nI", "<cmd>LspInfo<cr>", desc = "Info" },
            { "<leader>nn", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" },
            { "<leader>ne", function() vim.diagnostic.goto_prev() end, desc = "Prev Diagnostic" },
            { "<leader>nA", function() vim.diagnostic.setloclist() end, desc = "Quickfix" },
            { "<leader>nR", function() vim.lsp.buf.rename() end, desc = "Rename" },
            { "<leader>nh", function() vim.lsp.buf.hover() end, desc = "Hover" },
            { "<leader>nH", function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
            { "<leader>nD", function() vim.lsp.buf.declaration() end, desc = "Declaration" },
            { "<leader>nd", "<cmd>Telescope lsp_definitions<CR>", desc = "Definition" },
            { "<leader>ni", "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
            { "<leader>nr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
            { "<leader>na", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
            { "<leader>nQ", "<cmd>LspRestart<cr>", desc = "Restart" },
            { "<leader>nj", "<cmd>LspStart<cr>", desc = "Start" },
            { "<leader>nJ", "<cmd>LspStop<cr>", desc = "Stop" },
            { "<leader>nl", function() vim.diagnostic.open_float() end, desc = "Line Diagnostics" },

            { "<leader>r", group = "Replace" },
            { "<leader>rt", "<CMD>ISwap<CR>", "ISwap"},
        },
    }
}
