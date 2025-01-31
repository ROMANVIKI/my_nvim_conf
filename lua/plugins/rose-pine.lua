return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "moon",
      dark_variant = "moon",
      bold_vert_split = false,
      dim_nc_background = true,
      disable_background = false,
      disable_float_background = false,
      disable_italics = true,

      groups = {
        background = "base",
        panel = "surface",
        border = "highlight_low",
        comment = "muted",
        link = "foam",
        punctuation = "muted",
        error = "pine",
        hint = "foam",
        info = "foam",
        warn = "gold",

        headings = {
          h1 = "foam",
          h2 = "pine",
          h3 = "foam",
          h4 = "pine",
          h5 = "foam",
          h6 = "pine",
        },
      },

      highlight_groups = {
        Boolean = { fg = "pine", blend = 10 },
        Cursor = { fg = "base", bg = "subtle" },
        CursorLine = { bg = "surface", blend = 30 },
        ErrorMsg = { fg = "pine", bold = true },
        LineNr = { fg = "highlight_low" },
        Search = { bg = "foam", blend = 40, inherit = false },
        Visual = { bg = "highlight_low", blend = 15 },
        ColorColumn = { bg = "surface", blend = 25 },
        CursorLineNr = { fg = "foam", blend = 10 },
        StatusLine = { fg = "subtle", bg = "surface" },
        Normal = { fg = "text", bg = "base" },
        SignColumn = { bg = "none" },
        VertSplit = { fg = "highlight_low", bg = "none" },

        -- Optimized syntax highlighting
        Comment = { fg = "muted", blend = 10 },
        String = { fg = "foam", blend = 10 },
        Function = { fg = "pine", blend = 8 },
        Keyword = { fg = "subtle", blend = 0 }, -- More visible keywords
        Identifier = { fg = "foam", blend = 15 },
        Type = { fg = "subtle", blend = 5 },
        Special = { fg = "pine", blend = 15 },
        Constant = { fg = "foam", blend = 10 },
        PreProc = { fg = "subtle", blend = 5 },
        Include = { fg = "pine", blend = 10 },
        Define = { fg = "pine", blend = 10 },
        Operator = { fg = "muted", blend = 0 }, -- Clear operators
        NonText = { fg = "muted", blend = 20 }, -- Less distracting
        Directory = { fg = "foam", blend = 10 },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd("colorscheme rose-pine")

      -- Enhanced comfort settings
      vim.opt.scrolloff = 8
      vim.opt.sidescrolloff = 8
      vim.opt.cursorline = true
      vim.opt.signcolumn = "yes"
      vim.opt.colorcolumn = "80"

      -- Additional optimizations for readability
      vim.opt.conceallevel = 0
      vim.opt.wrap = false
      vim.opt.linebreak = true
      vim.opt.list = true
      vim.opt.listchars = {
        tab = "▸ ",
        trail = "·",
        extends = "›",
        precedes = "‹",
        nbsp = "␣",
      }
    end,
  },
}
