return {
  "inc-rename.nvim",
  keys = {
    {
      "<leader>cr",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "lsp rename",
      expr = true
    }
  },
  after = function()
    require("inc_rename").setup {}
  end
}
