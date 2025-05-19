return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
        ["tsserver"] = function()
          lspconfig.tsserver.setup({
            settings = {
              completions = {
                completeFunctionCalls = true,
              },
            },
          })
        end,
        ["tailwindcss"] = function()
          lspconfig.tailwindcss.setup({
            settings = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    "tw`([^`]*)",
                    'tw="([^"]*)',
                    'tw={"([^"}]*)',
                    "tw\\.\\w+`([^`]*)",
                    "tw\\(.*?\\)`([^`]*)",
                  },
                },
              },
            },
          })
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup({
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                },
              },
            },
          })
        end,
      })
    end,
  },
}
