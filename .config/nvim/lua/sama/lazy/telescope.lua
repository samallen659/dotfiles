return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
        require("telescope").setup {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }
        }

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>le", "<cmd>Telescope quickfix<cr>")
        vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>")
    end
}
