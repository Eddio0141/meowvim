return {
  "nvim-spectre",
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Search and replace (spectre)"
    }
  },
  after = function()
    require("spectre").setup({
      find_engine = {
        ["rg"] = {
          args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--glob=!.git/**'
          }
        }
      },
      default = {
        find = {
          options = { "ignore-case", "hidden" }
        }
      }
    })
  end
}
