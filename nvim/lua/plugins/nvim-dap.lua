return {
  "nvim-dap",
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,          desc = "Continue debugging (or start)" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,     desc = "Run to cursor" },
    { "<leader>di", function() require("dap").step_into() end,         desc = "Step into" },
    { "<leader>do", function() require("dap").step_over() end,         desc = "Step over" },
    { "<leader>dO", function() require("dap").step_out() end,          desc = "Step out" },
    { "<leader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
    { "<leader>dr", function() require("dap").repl.open() end,         desc = "Open REPL" },
    { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle UI" },
  },
  after = function()
    vim.cmd.packadd("nvim-dap-virtual-text")
    vim.cmd.packadd("nvim-dap-ui")

    local dap = require("dap")

    dap.adapters = {
      codelldb = {
        type = "executable",
        command = vim.fn.exepath("codelldb"),
      }
    }

    dap.configurations = {
      cpp = {
        {
          name = "Launch (CodeLLDB)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          args = function()
            return vim.split(vim.fn.input("Args: "), "%s")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false
        }
      }
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    -- signs
    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "🔬", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "➤", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "✖", texthl = "", linehl = "", numhl = "" })

    -- set up extensions
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup {}
  end
}
