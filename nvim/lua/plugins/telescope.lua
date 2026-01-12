-- Fall back to find_files if not in a git repo
local project_files = function()
  local builtin = require("telescope.builtin")
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

---@param picker function the telescope picker to use
local function grep_current_file_type(picker)
  local current_file_ext = vim.fn.expand('%:e')
  local additional_vimgrep_arguments = {}
  if current_file_ext ~= '' then
    additional_vimgrep_arguments = {
      '--type',
      current_file_ext,
    }
  end
  local conf = require('telescope.config').values
  picker {
    vimgrep_arguments = vim.tbl_flatten {
      conf.vimgrep_arguments,
      additional_vimgrep_arguments,
    },
  }
end

--- Grep the string under the cursor, filtering for the current file type
local function grep_string_current_file_type()
  grep_current_file_type(require("telescope.builtin").grep_string)
end

--- Live grep, filtering for the current file type
local function live_grep_current_file_type()
  grep_current_file_type(require("telescope.builtin").live_grep)
end

--- Like live_grep, but fuzzy (and slower)
local function fuzzy_grep(opts)
  opts = vim.tbl_extend('error', opts or {}, { search = '', prompt_title = 'Fuzzy grep' })
  require("telescope.builtin").grep_string(opts)
end

local function fuzzy_grep_current_file_type()
  grep_current_file_type(fuzzy_grep)
end

return {
  "telescope.nvim",
  keys = {
    { "<leader><space>",   function() require('telescope.builtin').find_files({ hidden = true }) end,                   desc = '[t]elescope find files - ctrl[p] style' },
    { "<leader>/",         function() require('telescope.builtin').live_grep({ additional_args = { "--hidden" } }) end, desc = '[telescope] live grep' },
    { '<M-p>',             function() require("telescope.builtin").oldfiles() end,                                      desc = '[telescope] old files' },
    { '<leader>*',         function() require("telescope.builtin").grep_string() end,                                   desc = '[telescope] grep current string [*]' },
    { '<leader>tc',        function() require("telescope.builtin").quickfix() end,                                      desc = '[t]elescope quickfix list [c]' },
    { '<leader>tq',        function() require("telescope.builtin").command_history() end,                               desc = '[t]elescope command history [q]' },
    { '<leader>tl',        function() require("telescope.builtin").loclist() end,                                       desc = '[t]elescope [l]oclist' },
    { '<leader>tr',        function() require("telescope.builtin").registers() end,                                     desc = '[t]elescope [r]egisters' },
    { '<leader>tbb',       function() require("telescope.builtin").buffers() end,                                       desc = '[t]elescope [b]uffers [b]' },
    { '<leader>tbf',       function() require("telescope.builtin").current_buffer_fuzzy_find() end,                     desc = '[t]elescope current [b]uffer [f]uzzy find' },
    { '<leader>ss',        function() require("telescope.builtin").lsp_document_symbols() end,                          desc = 'telescope lsp document symbols' },
    { '<leader>sS',        function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,                 desc = 'telescope lsp dynamic workspace symbols' },
    { '<leader>tf',        function() fuzzy_grep() end,                                                                 desc = '[t]elescope [f]uzzy grep' },
    { '<M-f>',             function() fuzzy_grep_current_file_type() end,                                               desc = '[telescope] fuzzy grep filetype' },
    { '<M-g>',             function() live_grep_current_file_type() end,                                                desc = '[telescope] live grep filetype' },
    { '<leader>t*',        function() grep_string_current_file_type() end,                                              desc = '[t]elescope grep current string [*] in current filetype' },
    { '<leader>tg',        function() project_files() end,                                                              desc = '[t]elescope project files [g]' },
    { "<leader>tn",        function() require("telescope").extensions.notify.notify() end,                              desc = "telescope notifications" },
    { "gr",                function() require("telescope.builtin").lsp_references() end,                                desc = "go to references" },
    { "<leader>ca",        vim.lsp.buf.code_action,                                                                     desc = "lsp code action" },
    { "<leader>sK",        function() require("telescope.builtin").keymaps() end,                                       desc = "search for keymap" },
    { "<leader>th<space>", function() require("telescope.builtin").find_files() end,                                    desc = "telescope find files - hide files" },
    { "<leader>th/",       function() require("telescope.builtin").live_grep() end,                                     desc = "telescope live grep - hide files" }
  },
  after = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    -- load extensions
    vim.cmd.packadd("telescope-fzf-native.nvim")
    vim.cmd.packadd("telescope-ui-select.nvim")

    local layout_config = {
      vertical = {
        width = function(_, max_columns)
          return math.floor(max_columns * 0.99)
        end,
        height = function(_, _, max_lines)
          return math.floor(max_lines * 0.99)
        end,
        prompt_position = 'bottom',
        preview_cutoff = 0,
      },
    }

    local lz = require("lz.n")
    local function trouble_open(prompt_bufnr, opts)
      lz.trigger_load("trouble.nvim")
      require("trouble.sources.telescope").open(prompt_bufnr, opts)
    end
    local function trouble_add(prompt_bufnr, opts)
      lz.trigger_load("trouble.nvim")
      require("trouble.sources.telescope").add(prompt_bufnr, opts)
    end

    telescope.setup {
      defaults = {
        path_display = {
          'truncate',
        },
        layout_strategy = 'horizontal',
        layout_config = layout_config,
        mappings = {
          i = {
            ['<C-q>'] = trouble_open,
            ['<C-l>'] = trouble_add,
            ['<C-s>'] = actions.cycle_previewers_next,
            ['<C-a>'] = actions.cycle_previewers_prev,
          },
          n = {
            ['<C-q>'] = trouble_open,
            ['<C-l>'] = trouble_add,
            q = actions.close,
          },
        },
        preview = {
          treesitter = true,
        },
        history = {
          path = vim.fn.stdpath('data') .. '/telescope_history.sqlite3',
          limit = 1000,
        },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        vimgrep_arguments = {
          'rg',
          '-L',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        file_ignore_patterns = {
          "^.git/"
        }
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      },
    }

    -- telescope.load_extension('fzy_native')
    -- telescope.load_extension('smart_history')
    telescope.load_extension("fzf")
    telescope.load_extension("notify")
    telescope.load_extension("ui-select")
  end

}
