return {
  "yazi.nvim",
  keys = {
    { "<leader>e", "<cmd>Yazi cwd<cr>", desc = "Open Yazi cwd" },
    { "<leader>r", "<cmd>Yazi<cr>",     desc = "Open Yazi on current file" },
  },
  after = function()
    local yazi = require("yazi")
    yazi.setup()
  end
}
