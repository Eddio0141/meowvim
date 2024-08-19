return {
  "comment.nvim",
  event = "BufAdd",
  after = function()
    require('Comment').setup()
  end
}
