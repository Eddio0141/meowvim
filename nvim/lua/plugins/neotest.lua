return {
  "neotest",
  keys = {
    { "<leader>ut", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run file" },
    { "<leader>uT", function() require("neotest").run.run(vim.loop.cwd()) end,                          desc = "Run all test files" },
    { "<leader>ur", function() require("neotest").run.run() end,                                        desc = "Run nearest" },
    { "<leader>ul", function() require("neotest").run.run_last() end,                                   desc = "Run last" },
    { "<leader>us", function() require("neotest").summary.toggle() end,                                 desc = "Toggle summary" },
    { "<leader>uo", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show output" },
    { "<leader>uO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle output panel" },
    { "<leader>uS", function() require("neotest").run.stop() end,                                       desc = "Stop test" },
    { "<leader>ud", function() require("neotest").run.run({ strategy = "dap" }) end,                    desc = "Debug nearest" }
  },
  after = function()
    require("lz.n").trigger_load("nvim-dap")

    require("neotest").setup({
      adapters = {
        require("rustaceanvim.neotest")
      },
      status = {
        virtual_text = true
      },
      output = {
        open_on_run = true
      },
    })
  end
}
