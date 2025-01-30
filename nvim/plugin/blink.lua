require("blink.cmp").setup {
  appearance = {
    nerd_font_variant = 'mono'
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
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
