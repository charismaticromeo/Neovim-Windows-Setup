vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.filetype = "on"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")
vim.o.shell = "powershell"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s"
vim.o.shellquote = ""
vim.o.shellxquote = ""
