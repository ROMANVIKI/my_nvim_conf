-- lua/plugins/enhanced-formatting.lua
-- Enhanced formatting for all supported languages

return {
  -- Primary formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        python = { "isort", "black" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--single-quote",
            "--jsx-single-quote",
            "--tab-width=2",
            "--print-width=100",
            "--trailing-comma=es5",
            "--semi=true",
          },
        },
        black = {
          prepend_args = { "--line-length", "88", "--preview" },
        },
        isort = {
          prepend_args = { "--profile", "black" },
        },
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "flake8", "mypy" },
        css = { "stylelint" },
        scss = { "stylelint" },
        html = { "htmlhint" },
      },
    },
  },

  -- Mason for automatic tool installation
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language servers
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "pyright",
        "tailwindcss-language-server",
        "emmet-ls",

        -- Formatters
        "prettier",
        "black",
        "isort",
        "stylua",

        -- Linters
        "eslint_d",
        "flake8",
        "mypy",
        "stylelint",
        "htmlhint",

        -- Debug adapters
        "debugpy",
      },
    },
  },
}
