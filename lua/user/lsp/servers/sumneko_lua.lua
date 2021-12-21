local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').sumneko_lua.setup{
  capabilities = capabilities,
	cmd = { "lua-language-server" },
	settings = {
		runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT',
		},
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
