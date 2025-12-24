return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
        require("telescope").setup{
            defaults = {
                -- Ignore common folders/files
                file_ignore_patterns = {
                    ".git/",
                    "node_modules/",
                    ".env",
                    ".venv",
                    "dist/",
                    "build/",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                color_devicons = true, -- show icons in results
                layout_strategy = "flex",
                layout_config = {
                    horizontal = { preview_width = 0.55 },
                    vertical = { preview_height = 0.55 },
                    flex = { flip_columns = 140 },
                },
            },
        }
    end,
}
