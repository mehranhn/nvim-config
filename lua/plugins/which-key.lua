local status_ok, wk = pcall(require, "which-key");
if not status_ok then
    return;
end

vim.keymap.set("n", "<leader>?", function() wk.show({ global = false }) end, { desc = "Buffer Local Keymaps (which-key)" });

wk.setup({
    icons = {
        mappings = false,
    },
    spec = {
        { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
        { "<leader>q", "<cmd>q!<cr>", desc = "Quit" },
        { "<leader>h", "<cmd>nohlsearch<cr>", desc = "No Highlight" },
        { "<leader>u", "<cmd>Lazy<cr>", desc = "Lazy" },

        { "<leader>a", group = "invlist" },
        { "<leader>aa", "<cmd>set invlist<cr>", desc = "Toggle List Mode" },
        { "<leader>as", "<cmd>set spell!<cr>", desc = "Toggle Spell Mode" },

        { "<leader>c", group = "Buffers/Tabs" },
        { "<leader>cv", "<cmd>vsp<CR>", desc = "Split Vertically" },
        { "<leader>cx", "<cmd>sp<CR>", desc = "Split Horizontally" },
        { "<leader>ct", "<cmd>tabnew<CR>", desc = "New Tab" },
        { "<leader>cn", "<cmd>tabnext<CR>", desc = "Next Tab" },
        { "<leader>ce", "<cmd>tabprevious<CR>", desc = "Previous Tab" },
        { "<leader>cd", "<cmd>tabclose<CR>", desc = "Close Tab" },

        { "<leader>n", group = "Lsp" },
        { "<leader>nf", function() require("conform").format() end, desc = "Format" },
        { "<leader>nF", function() require("conform").format({ async = true }) end, desc = "Format Async" },
        { "<leader>nI", "<cmd>LspInfo<cr>", desc = "Info" },
        { "<leader>nK", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Toggle Inlay Hints" },
        { "<leader>nn", function() vim.diagnostic.jump({ count = 1, float = true }) end, desc = "Next Diagnostic" },
        { "<leader>ne", function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Prev Diagnostic" },
        { "<leader>nA", function() vim.diagnostic.setloclist() end, desc = "Quickfix" },
        { "<leader>nR", function() vim.lsp.buf.rename() end, desc = "Rename" },
        { "<leader>nh", function() vim.lsp.buf.hover({ border = "single" }) end, desc = "Hover" },
        { "<leader>nH", function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
        { "<leader>nD", function() vim.lsp.buf.declaration() end, desc = "Declaration" },
        { "<leader>na", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
        { "<leader>nQ", "<cmd>lsp restart<cr>", desc = "Restart" },
        { "<leader>nj", "<cmd>lsp start<cr>", desc = "Start" },
        { "<leader>nJ", "<cmd>lsp stop<cr>", desc = "Stop" },
        { "<leader>nl", function() vim.diagnostic.open_float() end, desc = "Line Diagnostics" },

        { "z1", "<cmd>set foldlevel=1<CR>", desc = "Fold Level 1" },
        { "z2", "<cmd>set foldlevel=2<CR>", desc = "Fold Level 2" },
        { "z3", "<cmd>set foldlevel=3<CR>", desc = "Fold Level 3" },
        { "z4", "<cmd>set foldlevel=4<CR>", desc = "Fold Level 4" },
        { "z5", "<cmd>set foldlevel=5<CR>", desc = "Fold Level 5" },
        { "z6", "<cmd>set foldlevel=6<CR>", desc = "Fold Level 6" },
        { "z7", "<cmd>set foldlevel=7<CR>", desc = "Fold Level 7" },
        { "z8", "<cmd>set foldlevel=8<CR>", desc = "Fold Level 8" },
        { "z9", "<cmd>set foldlevel=9<CR>", desc = "Fold Level 9" },
        { "z0", "<cmd>set foldlevel=10<CR>", desc = "Fold Level 10" },
        { "z-", "<cmd>set foldlevel=11<CR>", desc = "Fold Level 11" },
        { "z=", "<cmd>set foldlevel=12<CR>", desc = "Fold Level 12" },

        { "<leader>r", group = "Replace" },
        { "<leader>g", group = "Git" },
    },
});
