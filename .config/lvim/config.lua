-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

lvim.colorscheme = "moonfly"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

local autoCommands = {
    -- other autocommands
    open_folds = {
        { "BufReadPost,FileReadPost", "*", "normal zR" }
    }
}


-- Additional Plugins
lvim.plugins = {
    { "lunarvim/colorschemes" },
    { "bluz71/vim-moonfly-colors" },
    { "theprimeagen/harpoon" },
    { "mxsdev/nvim-dap-vscode-js" },
    { "leoluz/nvim-dap-go" },
    { "mfussenegger/nvim-dap-python" },
    { "theHamsta/nvim-dap-virtual-text" },
    {
        "microsoft/vscode-js-debug",
        lazy = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    },
    { "christoomey/vim-tmux-navigator" },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    }
}


-- window spliting
lvim.builtin.which_key.mappings["w"] = {
    name = "Window",
    v = { "<cmd>vsplit<cr>", "Vertical Split" },
    h = { "<cmd>split<cr>", "Horizontal Split" }
}

-- Moving lines in visul mode
local wk = require("which-key")

wk.register({
    J = { ":m '>+1<CR>gv=gv", "Move lines down" },
    K = { ":m '<-2<CR>gv=gv", "Move lines up" },
}, { mode = "v", prefix = "" })

-- Harpoon
local ui = require("harpoon.ui")

lvim.builtin.which_key.mappings["a"] = {
    name = "Harpoon",
    a = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Add File" },
    r = { '<cmd>lua require("harpoon.mark").rm_file()<CR>', "Remove File" },
    c = { '<cmd>lua require("harpoon.mark").clear_all()<CR>', "Clear List" },
}
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", function()
    ui.nav_next()
end)
vim.keymap.set("n", "<C-b>", function()
    ui.nav_prev()
end)

-- FORMATTER
lvim.format_on_save = true -- Change this to false if you prefer

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        command = "prettier",
        extra_args = { "--print-width", "120", "--tab-width", "4", "--use-tabs" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    {
        command = "gofmt",
        filetypes = { "go" },
    },
    {
        command = "golines",
        filetypes = { "go" },
    },
    {
        command = "goimports",
        filetypes = { "go" },
    },
}


lvim.builtin.dap.active = true
require("dap-go").setup()
require("nvim-dap-virtual-text").setup()
require("dap-python").setup('~/.local/share/lvim/mason/packages/debugpy/venv/bin/python')
