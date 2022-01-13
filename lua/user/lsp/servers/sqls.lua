local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').sqls.setup{
  cmd = {"sqls"}, -- , "-config", "path/to/config.yml"};
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = capabilities,
}
