return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  require("catppuccin").setup({
    flavour = "mocha", -- Using the darkest variant
    background = {
      light = "mocha",
      dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.25,
    },
    no_italic = true, -- Disabled italics for cleaner look
    no_bold = false,
    no_underline = false,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = { "bold" },
      keywords = { "bold" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { "bold" },
      operators = {},
    },
    color_overrides = {
      mocha = {
        base = "#0c0c14", -- Deeper background
        mantle = "#0a0a12", -- Darker mantle
        crust = "#080810", -- Darkest shade for contrast

        -- Softer text colors for better readability in dark theme
        text = "#d9d9d9", -- Slightly off-white
        subtext1 = "#b9b9b9",
        subtext0 = "#999999",

        -- Syntax colors - deep but visible
        blue = "#89b4fa",
        lavender = "#b4befe",
        sapphire = "#74c7ec",
        sky = "#89dceb",
        teal = "#94e2d5",
        green = "#a6e3a1",
        yellow = "#f9e2af",
        peach = "#fab387",
        maroon = "#eba0ac",
        red = "#f38ba8",
        mauve = "#cba6f7",
        pink = "#f5c2e7",
        flamingo = "#f2cdcd",
        rosewater = "#f5e0dc",
      },
    },
    highlight_overrides = {
      mocha = function(c)
        return {
          -- Basic editor colors
          Normal = { fg = c.text, bg = c.base },
          NormalFloat = { fg = c.text, bg = c.base },
          LineNr = { fg = c.overlay0 },
          CursorLine = { bg = c.mantle },
          CursorLineNr = { fg = c.mauve, bold = true },
          Visual = { bg = "#1a1926" },

          -- Menus and selections
          Pmenu = { fg = c.text, bg = c.mantle },
          PmenuSel = { fg = c.text, bg = "#2a2a3a" },

          -- Enhanced git colors
          GitSignsAdd = { fg = c.green },
          GitSignsChange = { fg = c.yellow },
          GitSignsDelete = { fg = c.red },

          -- Diagnostics with better visibility
          DiagnosticError = { fg = c.red },
          DiagnosticWarn = { fg = c.yellow },
          DiagnosticInfo = { fg = c.blue },
          DiagnosticHint = { fg = c.teal },
        }
      end,
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
    },
  }),
}
