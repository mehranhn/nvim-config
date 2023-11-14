local util = require 'lspconfig.util'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.sqlls.setup {
    cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern(".git", ".sqllsrc.json")
}
