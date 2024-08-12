require("neo-tree").setup({
  auto_clean_after_session_restore = true,
  close_if_last_window = true,
})

local keymap = vim.keymap

keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "toggle neotree" })
keymap.set("n", "<leader>r", "<cmd>Neotree reveal<cr>", { desc = "reveal current file in neotree" })
