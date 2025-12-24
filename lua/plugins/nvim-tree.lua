return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,     -- keep dotfiles visible, change to true to hide
                custom = { ".git", ".venv", ".env", "node_modules", "dist" },  -- <-- ignore .git folder
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        git = true,
                    },
                },
            },
            git = {
                enable = true,  -- you can still see git status icons if needed
                -- ignore = true,  -- ignore files listed in .gitignore (optional)
            },
        })
    end,
}
