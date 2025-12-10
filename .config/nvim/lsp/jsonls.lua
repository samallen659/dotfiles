return {
	cmd = { "jsonls", "--stdio" },
	filestypes = { "json", "jsonc" },
	root_markers = { ".git", "package.json" },
	settings = {
		json = {
			validate = { enable = true },
			schemas = {},
			format = {
				keepLines = true,
			},
		},
	},
}
