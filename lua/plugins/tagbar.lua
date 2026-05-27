-- HINT: Run the following command on you powershell with administrator privileges
-- choco install universal-ctags
return {
  "preservim/tagbar",
  cmd = "TagbarToggle",
  keys = {
    {"<F8>", "<cmd>TagbarToggle<cr>", desc="Toggle Tagbar"},
  },

  init=function()
    vim.g.tagbar_type_lua={
      ctagstype = "lua",
      kinds={
        "f:functions",
        "t:table",
        "m:modules",
        "v:variables",
      },
      sort=0,
    }

    vim.g.tagbar_width=30
    vim.g.tagbar_autofocus = 1
    vim.g.tagbar_sort = 0
  end,
}
