return {
  "bufferline.nvim",
  event = "BufEnter",
  after = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp"
      }
    })

    local keymap = vim.keymap

    -- those don't need to be checked with lz.n, since like it gets never used till another buf is opened
    keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "delete other buffers" })
    keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "delete buffers to the right" })
    keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "delete buffers to the left" })
  end
}
