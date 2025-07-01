-- lua/plugins/modern-debug.lua
-- Modern debug configuration with proper JS/TS support

return {
  -- Core DAP setup
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- Initialize DAP first
      local dap = require("dap")

      -- DAP doesn't have a setup() function, just configure signs
      -- Set up signs for breakpoints
      vim.fn.sign_define("DapBreakpoint", {
        text = "🔴",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "🟡",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = "🔵",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapStopped", {
        text = "▶️",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "❌",
        texthl = "DapBreakpointRejected",
        linehl = "",
        numhl = "",
      })
    end,
  },

  -- Mason DAP extension for reliable debug adapter management
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = {
        "python",
        "js-debug-adapter",
      },
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
  },

  -- Python debugging made easy
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- Try Mason first, fallback to system python
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      local debugpy_path = vim.fn.executable(mason_path) == 1 and mason_path or "python3"

      require("dap-python").setup(debugpy_path)
      require("dap-python").test_runner = "pytest"
    end,
  },

  -- Modern JavaScript/TypeScript debugging
  {
    "mxsdev/nvim-dap-vscode-js",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "microsoft/vscode-js-debug",
        opt = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
    config = function()
      require("dap-vscode-js").setup({
        -- Path to vscode-js-debug installation
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = {
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
        },
      })

      -- Configure for each language
      local dap = require("dap")
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          -- Node.js debugging
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**" },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**" },
          },
          -- Browser debugging
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          -- Next.js debugging
          {
            type = "pwa-node",
            request = "launch",
            name = "Next.js: debug server-side",
            program = "${workspaceFolder}/node_modules/.bin/next",
            args = { "dev" },
            cwd = "${workspaceFolder}",
            env = { NODE_OPTIONS = "--inspect" },
            skipFiles = { "<node_internals>/**" },
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Next.js: debug client-side",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
        }
      end
    end,
  },

  -- DAP UI configuration
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
      })

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = "<module",
        virt_text_pos = "eol",
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil,
      })

      -- Auto-open/close DAP UI
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Key mappings
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Set Conditional Breakpoint" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })

      -- Python-specific mappings
      vim.keymap.set("n", "<leader>dpr", function()
        require("dap-python").test_method()
      end, { desc = "Debug: Python Test Method" })

      vim.keymap.set("n", "<leader>dpc", function()
        require("dap-python").test_class()
      end, { desc = "Debug: Python Test Class" })

      vim.keymap.set("v", "<leader>ds", function()
        require("dap-python").debug_selection()
      end, { desc = "Debug: Python Selection" })
    end,
  },
}
