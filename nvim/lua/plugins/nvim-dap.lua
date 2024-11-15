return {
  "nvim-dap",
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    {
      "<leader>dc",
      function()
        require("dap.ext.vscode").load_launchjs(nil, {})
        require("dap").continue()
      end,
      desc = "Continue debugging (or start)"
    },
    { "<leader>dC", function() require("dap").run_to_cursor() end,     desc = "Run to cursor" },
    { "<leader>di", function() require("dap").step_into() end,         desc = "Step into" },
    { "<leader>do", function() require("dap").step_over() end,         desc = "Step over" },
    { "<leader>dO", function() require("dap").step_out() end,          desc = "Step out" },
    { "<leader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
    { "<leader>dr", function() require("dap").repl.open() end,         desc = "Open REPL" },
    { "<leader>du", function() require("dap").toggle() end,            desc = "Toggle UI" },
  },
  after = function()
    require("lz.n").trigger_load("nvim-dap-virtual-text")
    require("lz.n").trigger_load("nvim-dap-ui")

    local dap = require("dap")

    dap.adapters = {
      codelldb = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = vim.fn.exepath("codelldb"),
          args = { "--port", "${port}" }
        }
      }
    }
    dap.configurations = {
      cpp = {
        name = "Launch (CodeLLDB)",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false
      }
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
  end
}
