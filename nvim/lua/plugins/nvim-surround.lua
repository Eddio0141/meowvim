return {
  "nvim-surround",
  event = "BufAdd",
  after = function()
    require('nvim-surround').setup()
  end
}
