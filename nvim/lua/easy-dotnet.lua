-- this is setup from blink.lua as blink.lua has a dependency on easy-dotnet
if vim.g.did_load_easy_dotnet then
  return
end
vim.g.did_load_easy_dotnet = true

vim.g.use_easy_dotnet = vim.fn.executable("dotnet") == 1
if not vim.g.use_easy_dotnet then
  return
end

require("easy-dotnet").setup()
