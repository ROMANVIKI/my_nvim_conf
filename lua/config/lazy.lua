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
  install = { colorscheme = { "tokyonight", "habamax" } },
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

require("kanagawa").setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = false }, -- Primeagen typically prefers no italics
  functionStyle = { bold = true }, -- Bold functions for better readability
  keywordStyle = { bold = true }, -- Bold keywords
  statementStyle = { bold = true },
  typeStyle = { bold = true }, -- Bold types
  transparent = false,
  dimInactive = true,
  terminalColors = true,
  colors = {
    palette = {
      -- More muted, darker colors typical of Primeagen's setups
      sumiInk0 = "#16161D", -- Darker background
      sumiInk1 = "#181820", -- Slightly lighter dark
      sumiInk2 = "#1A1A22", -- For UI elements
      oldWhite = "#C8C093", -- Main text color
      fujiWhite = "#DCD7BA", -- Brighter text
      oniViolet = "#957FB8", -- Purple accents
      crystalBlue = "#7E9CD8", -- Blue accents
      springGreen = "#98BB6C", -- Green for strings
      carpYellow = "#E6C384", -- Yellow for functions
      autumnRed = "#C34043", -- Error red
    },
    theme = {
      dragon = {
        ui = {
          bg = "#16161D", -- Darker background
          bg_gutter = "#1A1A22", -- Slightly lighter for contrast
          fg = "#C8C093", -- Main text color
        },
        syntax = {
          keyword = "#957FB8", -- Purple for keywords
          func = "#E6C384", -- Yellow for functions
          string = "#98BB6C", -- Green for strings
          comment = "#565656", -- Dark gray for comments
        },
      },
    },
  },
  overrides = function(colors)
    return {
      -- Primeagen-style highlighting
      Normal = { bg = colors.theme.ui.bg, fg = colors.theme.ui.fg },
      Comment = { fg = colors.theme.syntax.comment, italic = false },
      Function = { fg = colors.theme.syntax.func, bold = true },
      Keyword = { fg = colors.theme.syntax.keyword, bold = true },
      String = { fg = colors.theme.syntax.string },
      CursorLine = { bg = colors.theme.ui.bg_gutter },
      LineNr = { fg = "#565656" }, -- Muted line numbers
      Visual = { bg = "#2D2D3A" }, -- Subtle selection
      Search = { bg = "#3D3D4A", fg = "#E6C384" }, -- Clear search highlighting
      Error = { fg = colors.palette.autumnRed, bold = true },
      StatusLine = { bg = "#1A1A22", fg = "#C8C093" }, -- Clean status line
      TabLine = { bg = "#1A1A22", fg = "#565656" }, -- Muted tabs
      TabLineSel = { bg = "#2D2D3A", fg = "#C8C093" }, -- Selected tab
    }
  end,
  theme = "dragon",
  background = {
    dark = "dragon",
    light = "dragon",
  },
})

vim.cmd("colorscheme kanagawa")
