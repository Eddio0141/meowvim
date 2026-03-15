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
      },
      clipboard_register = "+",
      integrations = {
        -- https://github.com/mikavilpas/yazi.nvim/blob/main/documentation/copy-relative-path-to-files.md
        resolve_relative_path_implementation = function(args, get_relative_path)
          -- By default, the path is resolved from the file/dir yazi was focused on
          -- when it was opened. Here, we change it to resolve the path from
          -- Neovim's current working directory (cwd) to the target_file.
          local cwd = vim.fn.getcwd()
          local path = get_relative_path({
            selected_file = args.selected_file,
            source_dir = cwd,
          })
          return path
        end,
      },
    }
  end
}
