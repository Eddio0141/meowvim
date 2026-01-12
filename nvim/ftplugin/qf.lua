require("lz.n").trigger_load("trouble.nvim")
local trouble = require("trouble")

vim.defer_fn(function()
  vim.cmd.cclose()
  trouble.open("quickfix")
end, 0)
