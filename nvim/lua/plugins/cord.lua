return {
  "cord.nvim",
  event = "DeferredUIEnter",
  after = function()
    local images = {
      "https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExZGs1eGJ4M2V4aGFmb3dzNngxYW91OGs2ajYyZnZsMmYzaHA2cnpubCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Uyk2ILd67PmAb6oPWR/giphy.gif",
      "https://i.pinimg.com/originals/dd/18/b3/dd18b311f3ceaa8579f5c420ead9b4a1.jpg",
    }
    local image = images[math.random(#images)]

    require('cord').setup {
      editor = {
        tooltip = 'Meowvim, neovim but for cats',
        icon = image,
      },
      buttons = {
        {
          label = 'View Repository',
          url = function(opts) return opts.repo_url end,
        },
      },
    }
  end
}
