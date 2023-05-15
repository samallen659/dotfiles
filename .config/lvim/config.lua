-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

lvim.colorscheme="moonfly"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel=99
vim.opt.foldlevelstart=99

local autoCommands = {
    -- other autocommands
    open_folds = {
        {"BufReadPost,FileReadPost", "*", "normal zR"}
    }
}


-- Additional Plugins
lvim.plugins = {
    {"lunarvim/colorschemes"},
    {"abecodes/tabout.nvim"},
	{"bluz71/vim-moonfly-colors"},
    {"theprimeagen/harpoon"}
}


lvim.builtin.which_key.mappings["w"] = {
    name = "Window",
    v = {"<cmd>vsplit<cr>","Vertical Split"},
    h = {"<cmd>split<cr>", "Horizontal Split"}
}


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.builtin.which_key.mappings["a"] = {

		name = "Harpoon",
		a = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Add File" },
		r = { '<cmd>lua require("harpoon.mark").rm_file()<CR>', "Remove File" },
		c = { '<cmd>lua require("harpoon.mark").clear_all()<CR>', "Clear List" },
}
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
