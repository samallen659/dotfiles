return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/notes",
      },
    },
  },
  keys = {
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Search Obsidian Tags" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow Obsidian Link" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
    { "<leader>ol", mode = { "v" }, "<cmd>ObsidianLink<cr>", desc = "Create Obsidian Link to existing file" },
  },
}
