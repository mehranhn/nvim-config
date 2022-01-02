local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local status_ok = pcall(require, "dap-go")
local wstatus_ok, which_key = pcall(require, "which-key")
require('lspconfig').gopls.setup {
  on_attach = function(client, bufnr)
    require("user.lsp.handlers").on_attach(client, bufnr)
    if status_ok then
      if not wstatus_ok then
        local opts = { noremap  = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>od", "<CMD>lua require('dap-go').debug_test()<CR>", opts)
      else
        local opts = {
          mode = "n", -- NORMAL mode
          prefix = "<leader>",
          buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
          silent = true, -- use `silent` when creating keymaps
          noremap = true, -- use `noremap` when creating keymaps
          nowait = true, -- use `nowait` when creating keymaps
        }
        local map = {
          o = {
            name = "Rust Tools",
            d = {"<CMD>lua require('dap-go').debug_test()<CR>", "Debug Test"},
          },
        }
        which_key.register(map, opts)
      end
    end
  end,
  capabilities = capabilities,
}
