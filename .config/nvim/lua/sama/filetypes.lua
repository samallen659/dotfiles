vim.filetype.add({
	extension = {
		tf = "terraform",
		tfvars = "terraform-vars",
	},
	pattern = {
		[".github/workflows/.*%.ya?ml"] = "yaml.ghactions",
	},
})
