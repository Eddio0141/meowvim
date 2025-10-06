return {
  "easy-dotnet.nvim",
  ft = { "cs", "csproj", "sln" },
  after = function()
    require("easy-dotnet").setup()
  end
}
