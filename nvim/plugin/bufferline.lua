require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp"
  }
})

local keymap = vim.keymap

keymap.set("n", "<s-h>", "<cmd>bprevious<cr>", { desc = "previous buffer" })
keymap.set("n", "<s-l>", "<cmd>bnext<cr>", { desc = "previous buffer" })

keymap.set("n", "<leader>bd",
  function()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
      local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
      if choice == 1 then -- Yes
        vim.cmd.write()
        bd(0)
      elseif choice == 2 then -- No
        bd(0, true)
      end
    else
      bd(0)
    end
  end, { desc = "close buffer" })

keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "delete other buffers" })
keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "delete buffers to the right" })
keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "delete buffers to the left" })
