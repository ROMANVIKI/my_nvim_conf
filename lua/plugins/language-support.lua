-- lua/plugins/language-support.lua
-- Comprehensive language support for HTML, CSS, JS, JSX, Python

return {
  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "scss",
        "javascript", -- This handles JSX syntax
        "typescript",
        "tsx", -- This is the correct parser for TypeScript JSX
        -- Remove "jsx" - it's not a separate parser
        "python",
        "json",
        "yaml",
        "toml",
        "markdown",
        "vim",
        "lua",
      },
    },
  },

  -- Enhanced JSX/TSX support
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },

  -- Better JavaScript/TypeScript experience
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  --   opts = {
  --     settings = {
  --       separate_diagnostic_server = true,
  --       publish_diagnostic_on = "insert_leave",
  --       expose_as_code_action = {},
  --       tsserver_path = nil,
  --       tsserver_plugins = {},
  --       tsserver_max_memory = "auto",
  --       tsserver_format_options = {},
  --       tsserver_file_preferences = {},
  --       tsserver_locale = "en",
  --       complete_function_calls = false,
  --       include_completions_with_insert_text = true,
  --       code_lens = "off",
  --       disable_member_code_lens = true,
  --       jsx_close_tag = {
  --         enable = false,
  --         filetypes = { "javascriptreact", "typescriptreact" },
  --       },
  --     },
  --   },
  -- },

  -- Python-specific enhancements

  -- CSS/SCSS enhancements
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "LazyFile",
  --   opts = {
  --     filetypes = { "css", "scss", "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  --     user_default_options = {
  --       RGB = true,
  --       RRGGBB = true,
  --       names = true,
  --       RRGGBBAA = false,
  --       AARRGGBB = true,
  --       rgb_fn = false,
  --       hsl_fn = false,
  --       css = false,
  --       css_fn = false,
  --       mode = "background",
  --       tailwind = true,
  --       sass = { enable = true, parsers = { "css" } },
  --       virtualtext = "■",
  --     },
  --   },
  -- },

  -- HTML/XML tag matching (duplicate removed)
  -- Note: nvim-ts-autotag was already defined above

  -- Better folding for all languages

  -- Tailwind CSS tools
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
}
