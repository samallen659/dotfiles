return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"dockerfile",
				"bicep",
				"go",
				"helm",
				"json",
				"python",
				"powershell",
				"sql",
				"toml",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			auto_install = true,
		})
	end,
}
