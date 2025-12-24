return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua",
                "python",
                "markdown",
                "markdown_inline",
                "vim",
                "vimdoc",
                "query",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
