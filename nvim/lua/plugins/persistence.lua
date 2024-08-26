return {
  "persistence.nvim",
  event = "BufReadPre",
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "restore session" }
  },
  after = function()
    require("lz.n").trigger_load("neo-tree")
    require("persistence").setup()
  end,
}
