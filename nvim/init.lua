vim.loader.enable()

local cmd = vim.cmd
local opt = vim.o
local g = vim.g

-- <leader> key. Defaults to `\`. Some people prefer space.
g.mapleader = ' '
g.maplocalleader = ' '

-- See :h <option> to see what the options do

-- Search down into subfolders
opt.path = vim.o.path .. '**'

opt.number = true
opt.relativenumber = true
opt.cursorline = true
-- opt.lazyredraw = true -- note: this causes problems with noice
opt.showmatch = false -- Highlight matching parentheses, etc
opt.incsearch = true
opt.hlsearch = true

opt.spell = false
opt.spelllang = 'en'

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.foldenable = true
opt.history = 2000
opt.nrformats = 'bin,hex' -- 'octal'
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.cmdheight = 0

opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.colorcolumn = '100'

opt.smartcase = true
opt.ignorecase = true
opt.wrap = true
opt.clipboard = "unnamedplus"
opt.title = true
opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - meowvim!"

-- wait for lualine to load and replace it
opt.laststatus = 0

-- Configure Neovim diagnostic messages

local function prefix_diagnostic(prefix, diagnostic)
  return string.format(prefix .. ' %s', diagnostic.message)
end

vim.diagnostic.config {
  virtual_text = {
    prefix = '',
    format = function(diagnostic)
      local severity = diagnostic.severity
      if severity == vim.diagnostic.severity.ERROR then
        return prefix_diagnostic('󰅚', diagnostic)
      end
      if severity == vim.diagnostic.severity.WARN then
        return prefix_diagnostic('⚠', diagnostic)
      end
      if severity == vim.diagnostic.severity.INFO then
        return prefix_diagnostic('ⓘ', diagnostic)
      end
      if severity == vim.diagnostic.severity.HINT then
        return prefix_diagnostic('󰌶', diagnostic)
      end
      return prefix_diagnostic('■', diagnostic)
    end,
  },
  signs = {
    text = {
      -- Requires Nerd fonts
      [vim.diagnostic.severity.ERROR] = '󰅚',
      [vim.diagnostic.severity.WARN] = '⚠',
      [vim.diagnostic.severity.INFO] = 'ⓘ',
      [vim.diagnostic.severity.HINT] = '󰌶',
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
}

-- Native plugins
cmd.filetype('plugin', 'indent', 'on')
cmd.packadd('cfilter') -- Allows filtering the quickfix list with :cfdo

-- let sqlite.lua (which some plugins depend on) know where to find sqlite
vim.g.sqlite_clib_path = require('luv').os_getenv('LIBSQLITE')

local lz_n = require("lz.n")
lz_n.load("plugins")

vim.cmd.colorscheme("catppuccin-macchiato")

-- custom file types
vim.filetype.add({
  extension = {
    hltas = "hltas"
  }
})

vim.diagnostic.config({
  virtual_lines = true
})
