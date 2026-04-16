vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.filetype = "on"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

-- Set dynamic textwidth to 80% of the current window width
vim.api.nvim_create_autocmd({ "VimResized", "WinEnter", "BufWinEnter" }, {
  callback = function()
    local width = vim.fn.float2nr(vim.fn.winwidth(0) * 0.8)
    vim.opt_local.textwidth = math.max(width, 40)
    vim.opt_local.colorcolumn = "+0"
  end
})
