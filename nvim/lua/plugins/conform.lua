return {
  "conform.nvim",
  event = "BufWritePre",
  after = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        nix = { "nixfmt" },
      },
      format_on_save = {
        -- timeout_ms = 500,
        lsp_format = "fallback",
      },
    })

    -- for the first time formatting
    local buf = vim.api.nvim_get_current_buf();
    conform.format({ bufnr = buf })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
