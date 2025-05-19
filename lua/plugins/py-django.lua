return {
  {
    "pappasam/nvim-repl",
    ft = { "python" },
    config = function()
      require("nvim-repl").setup({
        output_split = "horizontal",
        output_split_size = 12,
      })
    end,
  },
}
