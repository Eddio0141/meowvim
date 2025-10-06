require("blink.cmp").setup {
  appearance = {
    nerd_font_variant = 'mono'
  },
  sources = {
    default = { "lsp", "easy-dotnet", "path", "snippets", "buffer" },
    providers = {
      ["easy-dotnet"] = {
        name = "easy-dotnet",
        enabled = true,
        module = "easy-dotnet.completion.blink",
        score_offset = 10000,
        async = true,
      },
    },
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
