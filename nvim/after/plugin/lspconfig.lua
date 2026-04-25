local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Diagnostics
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    vim.keymap.set({ "n", "i" }, "<C-e>", function()
        vim.diagnostic.open_float(nil, {
            focus = false,       
            border = "rounded",   
            source = "always",  
        })
    end, opts)
end

vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('haskell-language-server')

vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        }
    },
    float = {
        border = "rounded",
        source = "always",
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = on_attach
})
