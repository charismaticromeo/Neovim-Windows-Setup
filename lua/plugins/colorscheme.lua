return {
    {
        "catppuccin/nvim",
        name = 'catppuccin',
        opts = {
            flavour = "mocha",
            transparent_background = true,
            -- term_colors = true,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {
            style = "night",
            transparent = true,
            on_colors = function(colors)
                colors.bg = "#0c0e14"
                colors.bg_dark = "#0a0c10"
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
        end,
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            local dracula = require("dracula")
            dracula.setup({
                -- High contrast options
                -- colors = {
                --     bg = "#282a36", -- Classic Dracula background
                --     fg = "#f8f8f2",
                --     selection = "#44475a",
                --     comment = "#6272a4",
                --     red = "#ff5555",
                --     orange = "#ffb86c",
                --     yellow = "#f1fa8c",
                --     green = "#50fa7b",
                --     purple = "#bd93f9",
                --     cyan = "#8be9fd",
                --     pink = "#ff79c6",
                --     brightness = 0, -- Set to 0 for the deepest darks
                -- },
                show_end_of_line = false,
                transparent_bg = false, -- Change to true if you want your terminal bg to show through
                italic_comment = true,
            })
        end,
    },
    {
        dir = vim.fn.stdpath("config"),
        config = function()
            vim.cmd([[colorscheme catppuccin]])    -- Toggle between available schemes.
        end,
    }
}

