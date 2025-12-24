return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "clangd", "jdtls" },
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Default config applied to all servers in the loop
        local default_config = {
            capabilities = capabilities,
        }

        -- Per-server overrides
        local server_configs = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            },

            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_markers = {
                    "compile_commands.json",
                    "compile_flags.txt",
                    ".git",
                },
            },
        }

        -- servers to enable
        local servers = { "pyright", "lua_ls", "clangd" }

        for _, server in ipairs(servers) do
            vim.lsp.config(
                server,
                vim.tbl_deep_extend(
                    "force",
                    default_config,
                    server_configs[server] or {}
                )
            )
            vim.lsp.enable(server)
        end
    end,
}
