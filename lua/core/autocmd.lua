vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.c", "*.cpp", "*.h", "*.hpp", "*.lua", "*.java" },
    callback = function()
        -- Only format if an LSP client supports it
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client.supports_method("textDocument/formatting") then
                vim.lsp.buf.format({
                    async = false,
                    bufnr = 0,
                })
                return
            end
        end
    end,
})

-- Java LSP Autostarter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        require("lsp.java")
    end,
})

