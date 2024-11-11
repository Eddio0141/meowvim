return {
  "toggleterm.nvim",
  keys = {
    "<c-/>",
    { "<leader>gg", desc = "Lazy git" }
  },
  after = function()
    require("toggleterm").setup({
      open_mapping = [[<c-/>]],
      direction = "float",
      float_opts = {
        border = "curved",
        title_pos = "left",
      },
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = function()
        -- don't do anything if this is lazygit
        local bufname = vim.api.nvim_buf_get_name(0)
        if string.match(bufname, "^term://.*:lazygit;#toggleterm#.*$") then
          return
        end

        local opts = { buffer = 0 }
        vim.keymap.set('t', '<c-esc>', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end
    })

    -- custom terminals
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({
      cmd = "lazygit",
      display_name = "lazygit",
      hidden = true,
    })

    vim.keymap.set("n", "<leader>gg", function()
      lazygit:toggle()
    end, { noremap = true, silent = true, desc = "Lazy git" })
  end
}
