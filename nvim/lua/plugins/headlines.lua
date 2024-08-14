return {
  "headlines.nvim",
  ft = "md",
  after = function()
    require("headlines").setup()
  end,
}
