return {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        vim.lsp.config('pyright', { capabilities = capabilities })
        vim.lsp.config('clangd', { capabilities = capabilities })

    end
}
