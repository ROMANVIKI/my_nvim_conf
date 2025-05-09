return {
  "gbprod/yanky.nvim",
  opts = {},
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 100,
      },
      highlight = {
        on_put = true,
        on_yank = true,
      },
    })

    -- Optional keybindings
    vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)")
    vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)")
    vim.keymap.set("n", "<leader>p", "<cmd>YankyRingHistory<CR>")
  end,
}
