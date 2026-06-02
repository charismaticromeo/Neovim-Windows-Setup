local keymap = vim.keymap.set

-- ===============================
-- Telescope (fuzzy finder)
-- ===============================
keymap("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end
)

keymap("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end
)

keymap("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end
)

keymap("n", "<leader>fh", function()
  require("telescope.builtin").hash_tags()
end
)

-- ===============================
-- Neovim-tree (file explorer)
-- ===============================
-- Toggle nvim-tree
keymap("n", "<C-t>", ":NvimTreeToggle<CR>")

-- Focus on the tree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Refresh tree
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>")

-- ===============================
-- Split windows
-- ===============================
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- ===============================
-- LSP / Code Actions (if using cmp + lsp)
-- ===============================
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
keymap("n", "gk", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open floating diagnostic message" })
keymap("n", "gl", ":lua vim.diagnostic.setqflist()<CR>", { desc = "Open pane diagnostic panel" })
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")

-- ===============================
-- Toggle terminal (toggle floating terminal)
-- ===============================

keymap("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float name='Black Pearl'<cr>",
  { desc = "Floating terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>",
  { desc = "Vertical terminal" })

-- Escape terminal mode easily
keymap("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Navigate splits from terminal
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

-- ===============================
-- Markdown preview toggle (if you use glow or render-markdown)
-- ===============================
keymap("n", "<leader>mp", ":Glow<CR>")

-- Tagbar to map functions activated using F8.
keymap("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })
