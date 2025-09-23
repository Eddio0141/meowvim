return {
  "marks.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("marks").setup {
      builtin_marks = { "'", ".", "<", ">", "^" },
    }
  end
}
