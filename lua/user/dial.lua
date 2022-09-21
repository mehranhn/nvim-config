local status_ok, augend = pcall(require, "dial.augend")
if not status_ok then
  return
end

local status_okk, conf = pcall(require, "dial.config")
if not status_okk then
  return
end

local status_okkk, map = pcall(require, "dial.map")
if not status_okkk then
  return
end

conf.augends:register_group{
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
  },
  typescript = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.new{ elements = {"let", "const"} },
  },
}

vim.api.nvim_set_keymap("n", "<C-a>", map.inc_normal(), {noremap = true})
vim.api.nvim_set_keymap("n", "<C-r>", map.dec_normal(), {noremap = true})
vim.api.nvim_set_keymap("v", "<C-a>", map.inc_visual(), {noremap = true})
vim.api.nvim_set_keymap("v", "<C-r>", map.dec_visual(), {noremap = true})
vim.api.nvim_set_keymap("v", "g<C-a>", map.inc_gvisual(), {noremap = true})
vim.api.nvim_set_keymap("v", "g<C-r>", map.dec_gvisual(), {noremap = true})
