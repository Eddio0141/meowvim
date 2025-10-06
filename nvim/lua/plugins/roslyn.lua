return {
  "roslyn.nvim",
  ft = { "cs", "csproj", "sln" },
  after = function()
    require("roslyn").setup({
      cmd = {
        "Microsoft.CodeAnalysis.LanguageServer",
        "--logLevel",              -- this property is required by the server
        "Information",
        "--extensionLogDirectory", -- this property is required by the server
        vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
        "--stdio",
      },
      broad_search = true
    })
  end
}
