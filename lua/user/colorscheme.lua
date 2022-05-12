-- tokyonight
vim.g.tokyonight_style = "night"

-- rose_pine
vim.g.rose_pine_variant = "main"

-- vscode
vim.g.vscode_style = "dark"
vim.g.vscode_italic_comment = 1

-- neon
vim.g.neon_style = "doom"

-- material
local status_ok, material = pcall(require, "material")
if status_ok then
    material.setup()
end
vim.g.material_style = "darker"

vim.cmd [[
    try
    colorscheme vscode
    catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
    endtry
]]
