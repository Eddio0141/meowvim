vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "Cargo.toml",
  callback = function()
    local opts = function(desc)
      return { silent = true, buffer = true, desc = desc }
    end

    vim.keymap.set("n", "<leader>cu", require("crates").update_crate, opts("update a cargo crate"))
    vim.keymap.set("v", "<leader>cu", require("crates").update_crates, opts("update selected cargo crates"))
    vim.keymap.set("n", "<leader>ca", require("crates").update_all_crates, opts("update all cargo crates"))
    vim.keymap.set("n", "<leader>cU", require("crates").upgrade_crate, opts("upgrade a cargo crate"))
    vim.keymap.set("v", "<leader>cU", require("crates").upgrade_crates, opts("upgrade selected cargo crates"))
    vim.keymap.set("n", "<leader>cA", require("crates").upgrade_crates, opts("upgrade all cargo crates"))
  end
})

return {
  "crates.nvim",
  event = "BufRead Cargo.toml",
  after = function()
    require("crates").setup()
  end
}
