require("trouble").setup()

local keymap = vim.keymap

keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "trouble buffer diagnostics" })
keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "trouble workspace diagnostics" })
