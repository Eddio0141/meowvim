require("persistence").setup()

vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "restore session" })
