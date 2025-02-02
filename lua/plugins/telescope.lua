return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency for telescope
      "nvim-telescope/telescope-fzf-native.nvim", -- Optional: for better performance
      build = "make",
    },
    config = function()
      -- Basic Telescope setup
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              -- Map Esc to close the Telescope window
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
        pickers = {
          find_files = {
            -- theme = "dropdown", -- Use a dropdown theme for the find_files picker
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {},
        },
      })

      -- Load optional plugins like fzf-native for better performance
      pcall(require("telescope").load_extension, "fzf")

      -- Keybindings for Telescope
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<space>ep", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)

      vim.keymap.set("n", "<leader>mg", function()
        require("plugins.multigrep").live_multigrep()
      end, { desc = "Multi Grep" })
    end,
  },
}
