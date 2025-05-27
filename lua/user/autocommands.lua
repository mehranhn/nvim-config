vim.api.nvim_create_augroup("_general_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "_general_settings",
    pattern = { "qf", "help", "man", "lspinfo" },
    callback = function()
        vim.keymap.set("n", "q", ":close<CR>", { buffer = true, silent = true })
    end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = "_general_settings",
    callback = function()
        vim.opt.formatoptions:remove("cro")
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = "_general_settings",
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- Git settings
vim.api.nvim_create_augroup("_git", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "_git",
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Markdown settings
vim.api.nvim_create_augroup("_markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "_markdown",
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.conceallevel = 1
        vim.opt_local.concealcursor = 'i'
    end,
})

-- Auto resize
vim.api.nvim_create_augroup("_auto_resize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
    group = "_auto_resize",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Alpha settings
vim.api.nvim_create_augroup("_alpha", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "_alpha",
  pattern = "AlphaReady",
  callback = function()
    vim.opt.showtabline = 0
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.showtabline = 2
      end,
    })
  end,
})

-- Crates settings
vim.api.nvim_create_augroup("_cartes", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "_cartes",
  pattern = "toml",
  callback = function()
    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
  end,
})

vim.api.nvim_create_augroup("_highlight_yank", { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = "_highlight_yank",
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.hl.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})
