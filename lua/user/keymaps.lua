local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local function nxomap(lhs, rhs, o)
    vim.api.nvim_set_keymap("n", lhs, rhs, o)
    vim.api.nvim_set_keymap("x", lhs, rhs, o)
    vim.api.nvim_set_keymap("o", lhs, rhs, o)
end
local function nxmap(lhs, rhs, o)
    vim.api.nvim_set_keymap("n", lhs, rhs, o)
    vim.api.nvim_set_keymap("x", lhs, rhs, o)
end
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
nxomap("k", "i", {noremap = true})
nxomap("K", "I", {noremap = true})
nxomap("i", "<NOP>", {noremap = true})
nxomap("I", "<NOP>", {noremap = true})
nxomap("l", "<NOP>", {noremap = true})
nxomap("L", "<NOP>", {noremap = true})
nxomap("j", "<NOP>", {noremap = true})
nxomap("J", "<NOP>", {noremap = true})
keymap("n", "U", "<CMD>redo<CR>", opts)
-- keymap("n", "<C-r>", "<Nop>", opts)
keymap("n", ",", "n", opts)
keymap("n", ".", "N", opts)

-- navigation
-- nxomap("h", "h", opts)
nxomap("n", "j", opts)
nxomap("e", "k", opts)
nxomap("i", "l", opts)

nxomap("H", "^", opts)
nxomap("N", "5<DOWN>", opts)
nxomap("E", "5<UP>", opts)
nxomap("I", "<END>", opts)

--[[ nxmap("<C-L>", "<C-d>", opts) ]]
--[[ nxmap("<C-U>", "<C-u>", opts) ]]

-- keymap("n", "<C-E>", "<C-y>", opts)
-- keymap("n", "<C-N>", "<C-e>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-n>", "<C-w>j", opts)
keymap("n", "<A-e>", "<C-w>k", opts)
keymap("n", "<A-i>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-i>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-Tab>", "<CMD>bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<C-n>", ":m .+1<CR>", opts)
keymap("n", "<C-e>", ":m .-2<CR>", opts)

-- Press ne fast to enter
-- Insert --
-- keymap("i", "ne", "<ESC>", opts)
-- keymap("l", "<C-h>", "<left>", opts)
-- keymap("l", "<C-n>", "<down>", opts)
-- keymap("l", "<C-e>", "<up>", opts)
-- keymap("l", "<C-i>", "<right>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<C-n>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-e>", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<", "<gv", opts)
-- keymap("x", ">", ">gv", opts)
keymap("x", "<Tab>", ">gv", opts)
keymap("x", "<S-Tab>", "<gv", opts)

-- clipboard
nxmap("<C-p>", "\"ap", opts)
nxmap("<C-P>", "\"aP", opts)
nxmap("d", "\"ad", opts)
nxmap("D", "\"aD", opts)
nxmap("c", "\"ac", opts)
nxmap("C", "\"aC", opts)
nxmap("x", "\"ax", opts)
nxmap("X", "\"aX", opts)

keymap("c", "<C-p>", "<C-r>\"", opts)
--[[ keymap("c", "<C-P>", "\"+P", opts) ]]

-- macro
keymap("", "Q", "@q", opts)

-- spectre
keymap("v", "<leader>r", "<ESC><CMD>lua require('spectre').open_visual()<CR>", opts)
