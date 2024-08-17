# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin =
    src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  # lazily loaded plugins
  lazy-plugins = with pkgs.vimPlugins; [
    bufferline-nvim
    neo-tree-nvim
    nvim-autopairs
    (mkNvimPlugin inputs.eyeliner-nvim "eyeliner.nvim") # NOTE: temporary fix for load error
    # eyeliner-nvim # Highlights unique characters for f/F and t/T motions | https://github.com/jinh0/eyeliner.nvim
    inc-rename-nvim
    persistence-nvim
    toggleterm-nvim
    conform-nvim
    trouble-nvim
    nvim-surround # https://github.com/kylechui/nvim-surround/
    # telescope and extensions
    telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
    # telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim
    telescope-fzf-native-nvim
    # telescope-smart-history-nvim # https://github.com/nvim-telescope/telescope-smart-history.nvim
    telescope-ui-select-nvim
    # ^ telescope and extensions
  ];

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins =
    with pkgs.vimPlugins;
    [
      lz-n
      nvim-treesitter.withAllGrammars
      luasnip # snippets | https://github.com/l3mon4d3/luasnip/
      # nvim-cmp (autocompletion) and extensions
      nvim-cmp # https://github.com/hrsh7th/nvim-cmp
      cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
      lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
      cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
      cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
      cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
      cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
      cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/
      cmp-cmdline # cmp command line suggestions
      cmp-cmdline-history # cmp command line history suggestions
      # ^ nvim-cmp extensions
      # git integration plugins
      gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
      vim-fugitive # https://github.com/tpope/vim-fugitive/
      # ^ git integration plugins
      # UI
      lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/
      nvim-navic # Add LSP location to lualine | https://github.com/SmiteshP/nvim-navic
      statuscol-nvim # Status column | https://github.com/luukvbaal/statuscol.nvim/
      nvim-treesitter-context # nvim-treesitter-context
      # ^ UI
      # language support
      # ^ language support
      # navigation/editing enhancement plugins
      vim-unimpaired # predefined ] and [ navigation keymaps | https://github.com/tpope/vim-unimpaired/
      nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
      nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
      # ^ navigation/editing enhancement plugins
      # Useful utilities
      nvim-unception # Prevent nested neovim sessions | nvim-unception
      # ^ Useful utilities
      # libraries that other plugins depend on
      sqlite-lua
      plenary-nvim
      nvim-web-devicons
      vim-repeat
      # ^ libraries that other plugins depend on
      # bleeding-edge plugins from flake inputs
      # (mkNvimPlugin inputs.wf-nvim "wf.nvim") # (example) keymap hints | https://github.com/Cassin01/wf.nvim
      # ^ bleeding-edge plugins from flake inputs
      which-key-nvim
      yanky-nvim
      rustaceanvim
      noice-nvim
      mini-nvim
      leap-nvim
      alpha-nvim
      (pkgs.vimUtils.buildVimPlugin {
        name = "activitywatch";
        src = pkgs.fetchFromGitHub {
          owner = "activitywatch";
          repo = "aw-watcher-vim";
          rev = "4ba86d05a940574000c33f280fd7f6eccc284331";
          hash = "sha256-I7YYvQupeQxWr2HEpvba5n91+jYvJrcWZhQg+5rI908=";
        };
      })
      comment-nvim
      nvim-notify
      catppuccin-nvim
    ]
    # add the lazily loaded plugins
    ++ (map (
      x:
      {
        plugin = null;
        config = null;
        optional = true;
        runtime = { };
      }
      // (if x ? plugin then x else { plugin = x; })
    ) lazy-plugins);

  extraPackages = with pkgs; [
    lua-language-server
    # fd
    ripgrep
    lazygit
    nixd
    nixfmt-rfc-style
  ];
in
{
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json { plugins = all-plugins; };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
