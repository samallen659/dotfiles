local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
	pattern = { "markdown", "gitcommit" },
	command = ":set spell",
})
autocmd({ "FileType" }, {
	pattern = { "markdown", "gitcommit" },
	command = ":set wrap",
})
