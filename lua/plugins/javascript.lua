return {
  -- JavaScript/React/Next.js
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- TypeScript/JavaScript
      lspconfig.tsserver.setup {}
      -- CSS
      lspconfig.cssls.setup {}
      -- Tailwind
      lspconfig.tailwindcss.setup {}
      -- Python/Django
      lspconfig.pyright.setup {}
      -- HTML
      lspconfig.html.setup {}
    end,
  },
  {
    "pmizio/typescript-tools.nvim",  -- Better TypeScript support
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {}
    end,
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
  {
    "davidosomething/format-ts-errors.nvim",  -- Better TypeScript error formatting
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
  {
    "dmmulroy/tsc.nvim",  -- TypeScript compiler integration
    config = function()
      require("tsc").setup()
    end,
    ft = { "typescript", "typescriptreact" },
  },
}
