return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.nvim",
    },

    config = function()
        require("render-markdown").setup({
            link = {
                enabled = true,
                render_modes = false,

                footnote = {
                    enabled = true,
                    superscript = true,
                    prefix = "",
                    suffix = "",
                },

                image = "󰥶 ",
                email = "󰀓 ",
                hyperlink = "󰌹 ",

                highlight = "RenderMarkdownLink",

                wiki = {
                    icon = "󱗖 ",
                    body = function()
                        return nil
                    end,
                    highlight = "RenderMarkdownWikiLink",
                },

                custom = {
                    web = { pattern = "^http", icon = "󰖟 " },
                    github = { pattern = "github%.com", icon = "󰊤 " },
                    gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
                    stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
                    wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
                    youtube = { pattern = "youtube%.com", icon = "󰗃 " },
                },
            },

            callout = {
                note      = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
                tip       = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
                important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
                warning   = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
                caution   = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
                bug       = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
                example   = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
                quote     = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
            },

            checkbox = {
                enabled   = true,
                unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
                checked   = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
            },

            bullet = {
                enabled = true,
                icons = { "●", "○", "◆", "◇" },
            },

            quote = { icon = "▋" },

            anti_conceal = {
                enabled = true,
                ignore = {
                    code_background = true,
                    sign = true,
                },
            },
        })
    end,
}
