local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Colemak
-- general
vim.keymap.set({ "n", "x", "o" }, "k", "i", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "K", "I", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "i", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "I", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "l", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "L", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "j", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "J", "<NOP>", { noremap = true })
vim.keymap.set("n", "U", "<CMD>redo<CR>", opts)
-- keymap("n", "<C-r>", "<Nop>", opts)
vim.keymap.set("n", ",", "n", opts)
vim.keymap.set("n", ".", "N", opts)

-- Delete all keybindings starting with 'i' in Visual mode
local mappings = vim.api.nvim_get_keymap("v")
for _, mapping in ipairs(mappings) do
    if mapping.lhs:sub(1, 1) == "i" then
        pcall(vim.keymap.del, { "v", "x", "s" }, mapping.lhs)
    end
end

-- navigation
-- nxomap("h", "h", opts)
vim.keymap.set({ "n", "x", "o" }, "n", "j", opts)
vim.keymap.set({ "n", "x", "o" }, "e", "k", opts)
vim.keymap.set({ "n", "x", "o" }, "i", "l", opts)

vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "N", "5<DOWN>", opts)
vim.keymap.set({ "n", "x", "o" }, "E", "5<UP>", opts)
vim.keymap.set({ "n", "x", "o" }, "I", "<END>", opts)

-- vim.keymap.set({"n", "x"}, "<C-L>", "<C-d>", opts)
-- vim.keymap.set({"n", "x"}, "<C-U>", "<C-u>", opts)

-- vim.keymap.set("n", "<C-E>", "<C-y>", opts)
-- vim.keymap.set("n", "<C-N>", "<C-e>", opts)

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", opts)
vim.keymap.set("n", "<A-n>", "<C-w>j", opts)
vim.keymap.set("n", "<A-e>", "<C-w>k", opts)
vim.keymap.set("n", "<A-i>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- vim.keymap.set("n", "<S-i>", ":bnext<CR>", opts)
-- vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<CMD>bprevious<CR>", opts)

-- Move text up and down
vim.keymap.set("n", "<C-n>", ":m .+1<CR>", opts)
vim.keymap.set("n", "<C-e>", ":m .-2<CR>", opts)

-- Press ne fast to enter
-- Insert --
-- vim.keymap.set("i", "ne", "<ESC>", opts)
-- vim.keymap.set("l", "<C-h>", "<left>", opts)
-- vim.keymap.set("l", "<C-n>", "<down>", opts)
-- vim.keymap.set("l", "<C-e>", "<up>", opts)
-- vim.keymap.set("l", "<C-i>", "<right>", opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "<C-n>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<C-e>", ":move '<-2<CR>gv-gv", opts)
-- vim.keymap.set("x", "<", "<gv", opts)
-- vim.keymap.set("x", ">", ">gv", opts)
vim.keymap.set("x", "<Tab>", ">gv", opts)
vim.keymap.set("x", "<S-Tab>", "<gv", opts)

-- clipboard
vim.keymap.set({ "n", "x" }, "<C-p>", '"ap', opts)
vim.keymap.set({ "n", "x" }, "<C-P>", '"aP', opts)
vim.keymap.set({ "n", "x" }, "d", '"ad', opts)
vim.keymap.set({ "n", "x" }, "D", '"aD', opts)
vim.keymap.set({ "n", "x" }, "c", '"ac', opts)
vim.keymap.set({ "n", "x" }, "C", '"aC', opts)
vim.keymap.set({ "n", "x" }, "x", '"ax', opts)
vim.keymap.set({ "n", "x" }, "X", '"aX', opts)

vim.keymap.set("c", "<C-p>", '<C-r>"', opts)
-- vim.keymap.set("c", "<C-P>", "\"+P", opts)

-- macro
vim.keymap.set("", "Q", "@q", opts)

vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", { desc = 'Save' })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
vim.keymap.set("n", "<leader>u", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>aa", "<cmd>set invlist<cr>", { desc = "Toggle List Mode" })
vim.keymap.set("n", "<leader>as", "<cmd>set spell!<cr>", { desc = "Toggle Spell Mode" })

vim.keymap.set("n", "<leader>cv", "<cmd>vsp<CR>", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>cx", "<cmd>sp<CR>", { desc = "Split Horizontally" })
vim.keymap.set("n", "<leader>ct", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>cn", "<cmd>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>ce", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>cd", "<cmd>tabclose<CR>", { desc = "Close Tab" })

vim.keymap.set("n", "<leader>nI", "<cmd>checkhealth vim.lsp<cr>", { desc = "Info" })
vim.keymap.set("n", "<leader>nK", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Toggle Inlay Hints" })
vim.keymap.set("n", "<leader>nn", function() vim.diagnostic.jump({ count = 1, severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN, }, float = true }) end, { desc = "Next Diagnostic (error + warn)" })
vim.keymap.set("n", "<leader>ne", function() vim.diagnostic.jump({ count = -1, severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN, }, float = true }) end, { desc = "Prev Diagnostic (error + warn)" })
vim.keymap.set("n", "<leader>nN", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next Diagnostic (all)" })
vim.keymap.set("n", "<leader>nE", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev Diagnostic (all)" })
vim.keymap.set("n", "<leader>nA", function() vim.diagnostic.setloclist() end, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>nR", function() vim.lsp.buf.rename() end, { desc = "Rename" })
vim.keymap.set("n", "<leader>nh", function() vim.lsp.buf.hover({ border = "single" }) end, { desc = "Hover" })
vim.keymap.set("n", "<leader>nH", function() vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>nD", function() vim.lsp.buf.declaration() end, { desc = "Declaration" })
vim.keymap.set("n", "<leader>na", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
vim.keymap.set("n", "<leader>nQ", "<cmd>lsp restart<cr>", { desc = "Restart" })
vim.keymap.set("n", "<leader>nj", "<cmd>lsp start<cr>", { desc = "Start" })
vim.keymap.set("n", "<leader>nJ", "<cmd>lsp stop<cr>", { desc = "Stop" })
vim.keymap.set("n", "<leader>nl", function() vim.diagnostic.open_float() end, { desc = "Line Diagnostics" })

vim.keymap.set("n", "z1", "<cmd>set foldlevel=1<CR>", { desc = "Fold Level 1" })
vim.keymap.set("n", "z2", "<cmd>set foldlevel=2<CR>", { desc = "Fold Level 2" })
vim.keymap.set("n", "z3", "<cmd>set foldlevel=3<CR>", { desc = "Fold Level 3" })
vim.keymap.set("n", "z4", "<cmd>set foldlevel=4<CR>", { desc = "Fold Level 4" })
vim.keymap.set("n", "z5", "<cmd>set foldlevel=5<CR>", { desc = "Fold Level 5" })
vim.keymap.set("n", "z6", "<cmd>set foldlevel=6<CR>", { desc = "Fold Level 6" })
vim.keymap.set("n", "z7", "<cmd>set foldlevel=7<CR>", { desc = "Fold Level 7" })
vim.keymap.set("n", "z8", "<cmd>set foldlevel=8<CR>", { desc = "Fold Level 8" })
vim.keymap.set("n", "z9", "<cmd>set foldlevel=9<CR>", { desc = "Fold Level 9" })
vim.keymap.set("n", "z0", "<cmd>set foldlevel=10<CR>", { desc = "Fold Level 10" })
vim.keymap.set("n", "z-", "<cmd>set foldlevel=11<CR>", { desc = "Fold Level 11" })
vim.keymap.set("n", "z=", "<cmd>set foldlevel=12<CR>", { desc = "Fold Level 12" })
