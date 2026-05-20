return {
    -- Tokyonight
    {
        "folke/tokyonight.nvim",
        priority = 1000,
    },

     -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,

        -- Activate theme
        -- config = function()
        --     local theme = "gruvbox"
        --     vim.cmd.colorscheme(theme)
        -- end,
    },

    -- Transparent default
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,

        config = function()

            vim.cmd.colorscheme("default")

            local groups = {
                "Normal",
                "NormalFloat",
                "SignColumn",
                "EndOfBuffer",
                "LineNr",
            }

            for _, group in ipairs(groups) do
                vim.api.nvim_set_hl(0, group, { bg = "none" })
            end

        end,
    },
}
