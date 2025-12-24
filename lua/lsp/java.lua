local jdtls = require("jdtls")

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if not root_dir then
  return
end

local workspace_folder = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = { "jdtls" },
  root_dir = root_dir,
  workspace_folder = workspace_folder,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.junit.jupiter.api.Assertions.*",
        },
      },
    },
  },
}

jdtls.start_or_attach(config)

