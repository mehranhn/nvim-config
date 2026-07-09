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
