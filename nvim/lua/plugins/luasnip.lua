return {
  "luasnip",
  after = function()
    require("lz.n").trigger_load("friendly-snippets")
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
