return {
  "neo-tree.nvim",
  cmd = "Neotree",
  on_require = "neo-tree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "toggle neotree", },
    { "<leader>r", "<cmd>Neotree reveal<cr>", desc = "reveal current file in neotree" }
  },
  after = function()
    require("neo-tree").setup({
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
    })
  end,
}
