return {
    "nvim-treesitter/nvim-treesitter",
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
                "sql",
                "toml",
                "yaml",
            },
            highlight = {
                enable = true
            }
        })
    end,
}
