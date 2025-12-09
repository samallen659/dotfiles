-- ~/.config/nvim/lsp/terraform_ls.lua
-- Modern Neovim 0.11+ compatible LSP config for Terraform

return {
	cmd = { "terraform-ls", "serve" },

	filetypes = {
		"terraform",
		"tf",
		"hcl",
		"tfvars",
	},

	root_markers = { "main.tf", ".git", "terraform.tfvars", ".terraform" },

	-- Optional: Terraform LSP has a schema/hcl-specific setting block
	settings = {
		terraform = {
			-- enable formatting (if desired)
			format = {
				enable = true,
			},
			languageServer = {
				experimentalFeatures = {
					validateOnSave = true,
				},
			},
		},
	},
}
