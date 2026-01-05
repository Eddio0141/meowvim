return {
  "kitty-scrollback.nvim",
  event = "User KittyScrollbackLaunch",
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth", "KittyScrollbackGenerateCommandLineEditing" },
  after = function()
    require("kitty-scrollback").setup()
  end
}
