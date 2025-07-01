return {
  "conform.nvim",
  event = "BufWritePre",
  after = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        nix = { "nixfmt" },
        python = { "ruff_format" },
        javascript = { "deno_fmt" },
        typescript = { "deno_fmt" },
        json = { "deno_fmt" },
        markdown = { "deno_fmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })

    -- for the first time formatting
    local buf = vim.api.nvim_get_current_buf();
    conform.format({ bufnr = buf })
  end
}
