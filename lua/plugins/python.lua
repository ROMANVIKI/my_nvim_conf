return {
  -- Django/Python specific
  {
    "rafi/vim-venom", -- Python virtual environment management
    ft = { "python" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python",
          "javascript",
          "typescript",
          "tsx",
          "css",
          "html",
          "dockerfile",
          "yaml",
          "json",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "petobens/poet-v", -- Poetry environments manager
    ft = { "python" },
  },
}
