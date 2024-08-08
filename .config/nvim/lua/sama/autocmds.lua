local autocmd = vim.api.nvim_create_autocmd

autocmd({'FileType'}, {
    pattern = {'markdown', 'gitcommit'},
    callback = function()
        require('cmp').setup({ enabled=false })
        -- vim.cmd([[set wrap]])
        vim.opt.wrap = true
        vim.opt.linebreak = true
    end,
})
