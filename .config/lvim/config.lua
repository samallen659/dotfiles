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
    { "abecodes/tabout.nvim" },
    { "bluz71/vim-moonfly-colors" },
    { "theprimeagen/harpoon" },
    { "mxsdev/nvim-dap-vscode-js" },
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

-- Tabout
require('tabout').setup {
    tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true,            -- shift content if tab out is not possible
    act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '<C-d>',  -- reverse shift default action,
    enable_backwards = true,      -- well ...
    completion = true,            -- if the tabkey is used in a completion pum
    tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '(', close = ')' },
        { open = '[', close = ']' },
        { open = '{', close = '}' }
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
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
}


lvim.builtin.dap.active = true

local debugger_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/lazy/opt/vscode-js-debug"

require("dap-vscode-js").setup {
    node_path = "node",
    debugger_path = debugger_path,
    -- debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

for _, language in ipairs { "typescript", "javascript" } do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
    }
end

for _, language in ipairs { "typescriptreact", "javascriptreact" } do
    require("dap").configurations[language] = {
        {
            type = "pwa-chrome",
            name = "Attach - Remote Debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
        },
        {
            type = "pwa-chrome",
            name = "Launch Chrome",
            request = "launch",
            url = "http://localhost:3000",
        },
    }
end
