if vim.g.lsp_config_setup then
  return
end
vim.g.lsp_config_setup = true

-- local omnisharp_bin = vim.fn.exepath("OmniSharp")
-- local pid = vim.fn.getpid()

local lspconfig = require("lspconfig")

-- lspconfig.omnisharp.setup {
--   cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
--
--   settings = {
--     FormattingOptions = {
--       -- Enables support for reading code style, naming convention and analyzer
--       -- settings from .editorconfig.
--       EnableEditorConfigSupport = true,
--       -- Specifies whether 'using' directives should be grouped and sorted during
--       -- document formatting.
--       OrganizeImports = true,
--     },
--     MsBuild = {
--       -- If true, MSBuild project system will only load projects for files that
--       -- were opened in the editor. This setting is useful for big C# codebases
--       -- and allows for faster initialization of code navigation features only
--       -- for projects that are relevant to code that is being edited. With this
--       -- setting enabled OmniSharp may load fewer projects and may thus display
--       -- incomplete reference lists for symbols.
--       LoadProjectsOnDemand = false,
--     },
--     RoslynExtensionsOptions = {
--       -- Enables support for roslyn analyzers, code fixes and rulesets.
--       EnableAnalyzersSupport = true,
--       -- Enables support for showing unimported types and unimported extension
--       -- methods in completion lists. When committed, the appropriate using
--       -- directive will be added at the top of the current file. This option can
--       -- have a negative impact on initial completion responsiveness,
--       -- particularly for the first few completion sessions after opening a
--       -- solution.
--       EnableImportCompletion = true,
--       -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--       -- true
--       AnalyzeOpenDocumentsOnly = true,
--       -- Decompiler
--       EnableDecompilationSupport = true
--     },
--     Sdk = {
--       -- Specifies whether to include preview versions of the .NET SDK when
--       -- determining which version to use for project loading.
--       IncludePrereleases = true,
--     },
--   },
--
--   on_attach = function()
--     local keys = vim.keymap
--     -- keys.set("n", "gr", function() require("omnisharp_extended").telescope_lsp_references() end, { noremap = true })
--     -- options are supported as well
--     -- nnoremap gd <cmd>lua require('omnisharp_extended').telescope_lsp_definition({ jump_type = "vsplit" })<cr>
--     -- nnoremap <leader>D <cmd>lua require('omnisharp_extended').telescope_lsp_type_definition()<cr>
--     -- nnoremap gi <cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<cr>
--   end
-- }

lspconfig.denols.setup {}
lspconfig.html.setup {}
lspconfig.cssls.setup {}
