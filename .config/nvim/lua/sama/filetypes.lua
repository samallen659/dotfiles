vim.filetype.add({
	extension = {
		tf = "terraform",
		tfvars = "terraform-vars",
	},
	pattern = {
		[".github/workflows/.*%.ya?ml"] = "yaml.ghactions",
		[".*/[pP]laybooks/.*%.ya?ml"] = "yaml.ansible",
		[".*/[rR]oles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/[rR]oles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
	},
})
