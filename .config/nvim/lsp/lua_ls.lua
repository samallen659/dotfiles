return {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				version = "LuaJIT", -- or "Lua 5.1" if that's more accurate for your environment
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
				disable = { "lowercase-global" }, -- optional: reduce noise for Neovim scripts
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- picks up everything in runtimepath
				checkThirdParty = false, -- prevents unnecessary prompts about "third-party" libraries
			},
			telemetry = {
				enable = false, -- disable telemetry
			},
			format = {
				enable = true, -- enable formatting using lua_ls (optional)
			},
		},
	},
}
