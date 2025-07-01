-- lua/plugins/nodejs-utils.lua
-- Node.js and package management utilities
return {
  -- Package.json management
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup({
        colors = {
          up_to_date = "#3C4048",
          outdated = "#d19a66",
        },
        icons = {
          enable = true,
          style = {
            up_to_date = "|  ",
            outdated = "|  ",
          },
        },
        autostart = true,
        hide_up_to_date = false,
        hide_unstable_versions = false,
        package_manager = "npm",
      })
    end,
    keys = {
      { "<leader>ns", "<cmd>lua require('package-info').show()<cr>", desc = "Show package versions" },
      { "<leader>nc", "<cmd>lua require('package-info').hide()<cr>", desc = "Hide package versions" },
      { "<leader>nt", "<cmd>lua require('package-info').toggle()<cr>", desc = "Toggle package versions" },
      { "<leader>nu", "<cmd>lua require('package-info').update()<cr>", desc = "Update package on line" },
      { "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete package on line" },
      { "<leader>ni", "<cmd>lua require('package-info').install()<cr>", desc = "Install a new package" },
      {
        "<leader>np",
        "<cmd>lua require('package-info').change_version()<cr>",
        desc = "Install a different package version",
      },
    },
  },
  -- Better JSON support
  {
    "b0o/schemastore.nvim",
    ft = "json",
    config = function()
      require("lspconfig").jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,
  },
  -- Markdown preview for README files
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  },
  -- Git integration enhancements
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView Open" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "DiffView Close" },
    },
  },
  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float" },
      { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal Horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Terminal Vertical" },
    },
  },
  -- Live server alternative - simple HTTP server
  {
    "nguyenvukhang/nvim-toggler",
    event = "LazyFile",
    config = function()
      require("nvim-toggler").setup({
        remove_default_keybinds = true,
      })
    end,
    keys = {
      {
        "<leader>i",
        function()
          require("nvim-toggler").toggle()
        end,
        desc = "Toggle word",
      },
    },
  },
  -- Simple live server for HTML
  -- Auto-detect indentation
  {
    "nmac427/guess-indent.nvim",
    event = "LazyFile",
    config = function()
      require("guess-indent").setup({
        auto_cmd = true,
        filetype_exclude = {
          "netrw",
          "tutor",
        },
        buftype_exclude = {
          "help",
          "nofile",
          "terminal",
          "prompt",
        },
      })
    end,
  },
}
