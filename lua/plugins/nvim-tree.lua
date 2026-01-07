return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,     -- keep dotfiles visible, change to true to hide
                custom = { ".git", ".venv", ".env", "node_modules", "dist" },  -- <-- ignore .git folder
            },
            view = {
                width = function()
                    local total_columns = vim.go.columns
                    if total_columns <= 100 then
                        return 20
                    elseif total_columns <= 200 then
                        return 25
                    else
                        return 30
                    end
                end, 
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
