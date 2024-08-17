return {
  "persistence.nvim",
  event = "BufReadPre",
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "restore session" }
  },
  after = function()
    require("neo-tree")
    require("persistence").setup()
  end,
}
