return {
  "morhetz/gruvbox",
  lazy = false, -- Ensure it's loaded on startup
  priority = 1000, -- Set high priority to load before other plugins
  config = function()
    vim.o.termguicolors = true
    vim.cmd("colorscheme gruvbox")
    vim.o.background = "dark" -- Change to "light" if needed
  end,
}
