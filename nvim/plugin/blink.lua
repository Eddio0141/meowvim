local providers = {}
local source_defaults = { "lsp", "path", "snippets", "buffer" }

require("easy-dotnet")
if vim.g.use_easy_dotnet then
  providers["easy-dotnet"] = {
    name = "easy-dotnet",
    enabled = true,
    module = "easy-dotnet.completion.blink",
    score_offset = 10000,
    async = true,
  }

  local idx = vim.fn.indexof(source_defaults, "v:val == 'lsp'")
  if idx < 0 then
    vim.notify("failed to find lsp source providers for nvim blink", vim.log.levels.ERROR)
    return
  end
  source_defaults = vim.fn.insert(source_defaults, "easy-dotnet", idx + 1)
end

require("blink.cmp").setup {
  appearance = {
    nerd_font_variant = 'mono'
  },
  sources = {
    default = source_defaults,
    providers = providers,
  },
  completion = {
    documentation = { auto_show = true },
  },
  snippets = { preset = 'luasnip' },
  keymap = {
    preset = "default",
    ['<c-space>'] = { function(cmp) cmp.accept() end },
  }
}
