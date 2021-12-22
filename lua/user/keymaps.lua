local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "k", "i", opts)
keymap("n", "K", "I", opts)
-- keymap("n", "i", "", opts)
-- keymap("n", "I", "", opts)
keymap("n", "U", ":redo<CR>", opts)
-- keymap("n", "<C-r>", "", opts)
keymap("n", ",", "n", opts)
keymap("n", ".", "N", opts)

-- navigation
-- keymap("", "h", "h", opts)
keymap("", "n", "j", opts)
keymap("", "e", "k", opts)
keymap("", "i", "l", opts)
-- keymap("", "h", "", opts)
-- keymap("", "j", "", opts)
-- keymap("", "k", "", opts)
-- keymap("", "l", "", opts)

keymap("", "H", "0", opts)
keymap("", "N", "5j", opts)
keymap("", "E", "5k", opts)
keymap("", "I", "$", opts)

-- keymap("n", "<C-E>", "<C-y>", opts)
-- keymap("n", "<C-U>", "<C-e>", opts)

-- Normal --
 -- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-n>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- -- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-i>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- -- Move text up and down
keymap("n", "<A-n>", ":m .+1<CR>", opts)
keymap("n", "<A-e>", ":m .-2<CR>", opts)

-- Insert --
-- Press ne fast to enter
-- keymap("i", "ne", "<ESC>", opts)
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-n>", "<down>", opts)
keymap("i", "<C-e>", "<up>", opts)
keymap("i", "<C-i>", "<right>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-n>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<A-e>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "N", ":move '>+1<CR>gv-gv", opts)
keymap("x", "E", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-n>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-e>", ":move '<-2<CR>gv-gv", opts)

-- clipboard
keymap("n", "<C-p>", "\"\"p", opts)
keymap("v", "<C-p>", "\"\"p", opts)
keymap("x", "<C-p>", "\"\"p", opts)

keymap("n", "y", "\"*y", opts)
keymap("n", "Y", "\"*Y$", opts)
keymap("n", "p", "\"*p", opts)
keymap("n", "P", "\"*P", opts)
keymap("v", "y", "\"*y", opts)
keymap("v", "Y", "\"*Y$", opts)
keymap("v", "p", "\"*p", opts)
keymap("v", "P", "\"*P", opts)
keymap("x", "y", "\"*y", opts)
keymap("x", "Y", "\"*Y$", opts)
keymap("x", "p", "\"*p", opts)
keymap("x", "P", "\"*P", opts)

-- macro
keymap("", "Q", "@q", opts)

keymap("n", "l", "<CMD>bnext<CR>", opts)
keymap("n", "<S-l>", "<CMD>bprevious<CR>", opts)
keymap("i", "<S-Tab>", "<Tab>", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
