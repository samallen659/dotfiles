-- ~/.config/nvim/lsp/pyrefly.lua
-- Modern Neovim 0.11 LSP configuration for the PyreFly Python language server

-- Try to detect Mason install first
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/pyrefly"
local cmd = {}

if vim.fn.executable(mason_bin) == 1 then
	cmd = { mason_bin }
elseif vim.fn.executable("pyrefly") == 1 then
	cmd = { "pyrefly" }
else
	vim.notify("pyrefly LSP: could not find executable. Install via Mason or add to PATH.", vim.log.levels.ERROR)
	-- Return minimal config so the loader doesn't fail
	return {
		cmd = {},
		filetypes = { "python" },
	}
end

return {
	cmd = { "pyrefly", "lsp" },
	filetypes = { "python" },

	-- Modern root detection (Neovim 0.11)
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},

	-- Optional settings for PyreFly (modify as needed)
	settings = {
		pyrefly = {
			analysis = {
				typeCheckingMode = "basic", -- or "strict"
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
