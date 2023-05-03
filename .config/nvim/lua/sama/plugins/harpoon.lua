local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
	a = {
		name = "Harpoon",
		a = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Add File" },
		r = { '<cmd>lua require("harpoon.mark").rm_file()<CR>', "Remove File" },
		c = { '<cmd>lua require("harpoon.mark").clear_all()<CR>', "Clear List" },
	},
}, { prefix = " " })

vim.keymap.set("n", "<leader>r", mark.rm_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function()
	ui.nav_next()
end)
vim.keymap.set("n", "<C-b>", function()
	ui.nav_prev()
end)
