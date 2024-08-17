return {
  "trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "trouble buffer diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",              desc = "trouble workspace diagnostics" }
  },
  after = function()
    require("trouble").setup()
  end
}
