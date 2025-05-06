return {
  -- Docker support
  {
    "dgrbrady/nvim-docker", -- Docker integration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("nvim-docker").setup()
    end,
    cmd = { "Docker" },
  },
}
