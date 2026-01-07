-- ============================================================================
-- GitHub Actions Language Server Configuration
-- ============================================================================
-- Place this file at: ~/.config/nvim/lsp/gh_actions_ls.lua

return {
	-- Command to start the language server
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/gh-actions-language-server", "--stdio" },
	-- Filetypes this server should attach to
	filetypes = { "yaml.ghactions" },

	-- Root directory patterns to identify the project root
	root_markers = { ".github", ".git" },

	-- Server-specific settings
	settings = {
		["github-actions-ls"] = {
			-- Enable validation
			validate = true,
			-- Enable completion
			completion = true,
		},
	},

	-- Additional initialization options
	init_options = {},

	-- Disable certain capabilities if needed
	-- capabilities = {
	--   -- Example: disable formatting if you want to use another formatter
	--   documentFormattingProvider = false,
	-- },

	-- Custom on_attach handler (optional)
	-- on_attach = function(client, bufnr)
	--   -- Custom logic when server attaches to buffer
	-- end,
}
