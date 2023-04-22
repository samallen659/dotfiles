vim.g.mapleader = " "

local wk = require("which-key")

wk.register({
	h = { ":nohl<CR>", "Remove Highlights" },
	s = {
		name = "Windows",
		v = { "<C-w>v", "Split window vertically" },
		h = { "<C-w>s", "Split window horizontally" },
		e = { "<C-w>=", "Make split windows equal width" },
		x = { ":close<CR>", "close current split window" },
		m = { ":MaximizerToggle<CR>", "Toggle Window Maximise" },
	},
	e = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
	t = {
		name = "Tabs",
		o = { ":tabnew<CR>", "Open new tab" },
		x = { ":tabclose<CR>", "Close current tab" },
		n = { ":tabn<CR>", "Go to next tab" },
		p = { ":tabp<CR>", "Go to previous tab" },
	},
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		c = { "<cmd>Telescope grep_string<cr>", "Grep String" },
		b = { "<cmd>Telescope buffers<cr>", "Find open buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "Find tags" },
		t = { "<cmd>Telescope treesitter<cr>", "Treesitter queries" },
	},
	w = { "<cmd>WhichKey<cr>", "WhichKey Base" },
}, { prefix = "<leader>" })

wk.register({
	J = { ":m '>+1<CR>gv=gv", "Move lines down" },
	K = { ":m '<-2<CR>gv=gv", "Move lines up" },
}, { mode = "v", prefix = "" })
