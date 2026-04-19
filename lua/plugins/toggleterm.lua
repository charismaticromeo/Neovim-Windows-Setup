return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      name = "Black Pearl",
      size = function(term)
        if term.direction == "horizontal" then
          return vim.o.lines * 0.3
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.3
        end
      end,
      open_mapping = nil, -- disabling default mappings
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = false,     -- changed to accomodate dynamic changes based on win size.
      direction = "horizontal", -- "float" | "vertical" | "horizontal" | "tab"
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 3,
        -- Dynamic size for floating window
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
        -- Positioning it in the center
        row = function()
          return math.floor((vim.o.lines - math.floor(vim.o.lines * 0.8)) / 2)
        end,
        col = function()
          return math.floor((vim.o.columns - math.floor(vim.o.columns * 0.8)) / 2)
        end,
      },
    })
  end,
}
