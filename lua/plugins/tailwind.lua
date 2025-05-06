return {
  -- Tailwind-specific plugins
  {
    "roobert/tailwindcss-colorizer-cmp.nvim", -- Tailwind colors in completion
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
  },
  {
    "laytan/tailwind-sorter.nvim", -- Sort Tailwind classes automatically
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = function()
      require("tailwind-sorter").setup()
    end,
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
  },
}
