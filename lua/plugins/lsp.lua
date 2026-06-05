return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "clangd", "jdtls", "gopls", "asm_lsp" },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Default config applied to all servers in the loop
    local default_config = {
      capabilities = capabilities,
    }

    -- Per-server overrides
    local server_configs = {
      bashls = {
        filetypes = { "sh", "bash", "" }
      },

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

      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
            completeUnimported = true,
            usePlaceholders = true,
          },
        },
      },

      asm_lsp = {
        filetypes = { "asm", "vmasm", "s", "S" },
      },
    }

    -- servers to enable
    local servers = { "pyright", "lua_ls", "clangd", "gopls", "asm_lsp" }

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

    -- Auto-format and Organize Imports
    -- on Save for Go
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        -- 1. Find the active gopls client for the current buffer
        local clients = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })
        local gopls_client = clients[1]

        -- 2. Extract its position encoding, defaulting to utf-16 if not found
        local position_encoding = gopls_client and gopls_client.offset_encoding or "utf-16"

        -- 3. Pass the encoding into make_range_params to silence the warning
        local params = vim.lsp.util.make_range_params(0, position_encoding)

        params.context = { only = { "source.organizeImports" } }
        -- Synchronous code action call
        -- to save imports safely
        -- before writing the buffer
        --
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
        for _, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
            else
              vim.lsp.util.apply_workspace_edit(r.command)
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
