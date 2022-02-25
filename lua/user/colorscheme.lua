vim.g.tokyonight_style = "night"
vim.g.rose_pine_variant = 'main'
vim.cmd [[
    try
    colorscheme darkplus
    catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
    endtry
]]
