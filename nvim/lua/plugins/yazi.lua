return {
  "yazi.nvim",
  keys = {
    { "<leader>e", "<cmd>Yazi cwd<cr>", desc = "Open Yazi cwd" },
    { "<leader>r", "<cmd>Yazi<cr>",     desc = "Open Yazi on current file" },
  },
  after = function()
    require("yazi").setup {
      ---@diagnostic disable-next-line: missing-fields
      hooks = {
        on_yazi_ready = function(_, _, process_api)
          process_api:emit_to_yazi({ "hidden", "show" })
        end
      }
    }
  end
}
