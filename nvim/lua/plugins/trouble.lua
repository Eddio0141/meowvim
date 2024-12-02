return {
  "trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "trouble buffer diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",              desc = "trouble workspace diagnostics" },
    { "<C-c>",      mode = "n",                                         "<cmd>Trouble qflist toggle<cr>",      desc = "toggle quickfix list" }
  },
  after = function()
    require("trouble").setup({
      preview = {
        type = "float",
        border = "rounded",
      },
    })
  end
}
