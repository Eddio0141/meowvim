return {
  "conform.nvim",
  event = "BufWritePre",
  cmd = { "FormatEnable", "FormatDisable" },
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
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      formatters = {
        deno_fmt = {
          append_args = { "--prose-wrap", "preserve" },
        },
      },
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })

    -- for the first time formatting
    local buf = vim.api.nvim_get_current_buf();
    conform.format({ bufnr = buf })
  end
}
