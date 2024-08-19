return {
  "leap.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("leap").create_default_mappings()
  end
}
