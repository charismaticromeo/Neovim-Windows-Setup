-- NB: Run this command manually on your debian system to install ctags
-- sudo apt install exuberant-ctags
return {
  "preservim/tagbar",
  cmd = "TagbarToggle",
  keys = {
    { "<F8>", "<cmd>TagbarToggle<cr>", desc = "Toggle Tagbar" },
  },

  init = function()
    vim.g.tagbar_type_lua = {
      ctagstype = "lua",
      kinds = {
        "f:functions",
        "t:tables",
        "m:modules",
        "v:variables",
      },
      sort = 0,
    }

    vim.g.tagbar_width = 30
    vim.g.tagbar_autofocus = 1
    vim.g.tagbar_sort = 0
    -- vim.g.tagbar_show_linenumbers = 1
  end,
}
