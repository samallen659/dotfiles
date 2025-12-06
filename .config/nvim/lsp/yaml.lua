return {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "yaml", "yml" },
	settings = {
		yaml = {
			keyOrdering = false,
			format = {
				enable = true,
			},
			validate = true,
			schemaStore = {
				enable = true,
			},
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
			},
		},
	},
}
