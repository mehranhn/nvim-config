local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local pid = vim.fn.getpid()

require'lspconfig'.omnisharp.setup{
    cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(pid) };
    capabilities = capabilities,
}
