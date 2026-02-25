return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
		keys = {
			{ "<leader>pc", "<cmd>CopilotChat<cr>", mode = "n", desc = "Open Copilot Chat" },
			{ "<leader>pC", "<cmd>CopilotChatClose<cr>", mode = "n", desc = "Close Copilot Chat" },
			{ "<leader>pe", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Explain Code" },
			{ "<leader>pf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Fix Code Issues" },
			{ "<leader>po", "<cmd>CopilotChatOptimize<cr>", mode = "v", desc = "Optimize Code" },
			{ "<leader>pr", "<cmd>CopilotChatReview<cr>", mode = "v", desc = "Review Code" },
			{ "<leader>pd", "<cmd>CopilotChatDocs<cr>", mode = "v", desc = "Generate Docs" },
		},
	},
}
