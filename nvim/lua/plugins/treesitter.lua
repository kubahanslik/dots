return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = "main",
    build = ':TSUpdate',

    config = function()
        require('nvim-treesitter').install({ 'c', 'cpp', 'lua', 'python', 'javascript', 'typescript', 'bash', 'rust', 'zig', 'haskell', 'java', 'php' })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function() vim.treesitter.start() end,
        })
    end
}
