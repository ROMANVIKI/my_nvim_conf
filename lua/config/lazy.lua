local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Kanagawa Configuration (commented out for now)
require("kanagawa").setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { bold = true },
  statementStyle = { bold = true },
  typeStyle = { bold = true },
  transparent = false,
  dimInactive = true,
  terminalColors = true,
  colors = {
    palette = {
      sumiInk0 = "#16161D",
      sumiInk1 = "#181820",
      sumiInk2 = "#1A1A22",
      oldWhite = "#C8C093",
      fujiWhite = "#DCD7BA",
      oniViolet = "#957FB8",
      crystalBlue = "#7E9CD8",
      springGreen = "#98BB6C",
      carpYellow = "#E6C384",
      autumnRed = "#C34043",
    },
    theme = {
      dragon = {
        ui = {
          bg = "#16161D",
          bg_gutter = "#1A1A22",
          fg = "#C8C093",
        },
        syntax = {
          keyword = "#957FB8",
          func = "#E6C384",
          string = "#98BB6C",
          comment = "#565656",
        },
      },
    },
  },
  overrides = function(colors)
    return {
      Normal = { bg = colors.theme.ui.bg, fg = colors.theme.ui.fg },
      Comment = { fg = colors.theme.syntax.comment, italic = false },
      Function = { fg = colors.theme.syntax.func, bold = true },
      Keyword = { fg = colors.theme.syntax.keyword, bold = true },
      String = { fg = colors.theme.syntax.string },
      CursorLine = { bg = colors.theme.ui.bg_gutter },
      LineNr = { fg = "#565656" },
      Visual = { bg = "#2D2D3A" },
      Search = { bg = "#3D3D4A", fg = "#E6C384" },
      Error = { fg = colors.palette.autumnRed, bold = true },
      StatusLine = { bg = "#1A1A22", fg = "#C8C093" },
      TabLine = { bg = "#1A1A22", fg = "#565656" },
      TabLineSel = { bg = "#2D2D3A", fg = "#C8C093" },
    }
  end,
  theme = "dragon",
  background = {
    dark = "dragon",
    light = "dragon",
  },
})

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
})

-- Additional comfort settings
vim.opt.termguicolors = true
vim.opt.synmaxcol = 240 -- Prevent slow rendering on long lines
vim.opt.laststatus = 2
vim.opt.cmdheight = 1

-- Set colorscheme
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("rose-pine-moon")
-- vim.cmd.colorscheme("rose-pine-main")
vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("gruvbox")
