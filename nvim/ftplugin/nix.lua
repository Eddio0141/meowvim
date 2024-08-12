-- Exit if the language server isn't available
if vim.fn.executable('nixd') ~= 1 then
  return
end

local root_files = {
  'flake.nix',
  'default.nix',
  'shell.nix',
  '.git',
}

vim.lsp.start {
  name = 'nixd_ls',
  cmd = { 'nixd' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      -- formatting = {
      --   command = { "nixfmt" },
      -- },
      options = {
        -- nixos = {
        --   expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
        -- },
        -- home_manager = {
        --   expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
        -- },
      },
    }
  }
}
