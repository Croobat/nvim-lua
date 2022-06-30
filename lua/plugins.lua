--## Setup ## {{{
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  --}}}

  --- PLUGINS
  -- ## Mandatory ## {{{
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use { "lewis6991/impatient.nvim" } -- Faster startup
  -- }}}

  --## Completion (30ms) ##{{{

  -- Main LSP plugin
  use { "hrsh7th/cmp-nvim-lsp" }
  -- Language Server Installer
  use "williamboman/nvim-lsp-installer"
  -- Set of cool LSP settings
  use "tamago324/nlsp-settings.nvim"
  -- LSP handle config
  use { "neovim/nvim-lspconfig", config = "require 'plug-config.lsp'" }
  

  -- CoC... -.- (solo para css completion)
  use {"neoclide/coc.nvim", branch = "release", ft = { "css", "scss" }}

  -- Main Null-ls plugin
  use "jose-elias-alvarez/null-ls.nvim" -- External formatters and linters


  -- Main CMP plugin
  use { "hrsh7th/nvim-cmp", config = "require 'plug-config.cmp'" }
  -- CMP sources
  use { "hrsh7th/cmp-buffer" } -- buffer words
  use { "hrsh7th/cmp-path" } -- path
  use { "hrsh7th/cmp-cmdline" } -- cmdline
  use { "hrsh7th/cmp-nvim-lua" } -- lua API
  use { "David-Kunz/cmp-npm" } -- npm
  use { "hrsh7th/cmp-calc" } --calculator

  -- Snippets
  use { "L3MON4D3/LuaSnip",  } -- Snippet engine
  use { "saadparwaiz1/cmp_luasnip" } -- cmp integration
  use { "rafamadriz/friendly-snippets" } -- Friendly snippets

  -- Auto inserters
  use { "windwp/nvim-autopairs", config = "require 'plug-config.autopairs'" }
  use { "windwp/nvim-ts-autotag", event = "InsertEnter" } --autoclose tags
  use { "johmsalas/text-case.nvim", config = function() require('textcase').setup {} end }
  --}}}

  --## Navigation (10ms) ##{{{
  use { "kyazdani42/nvim-tree.lua", requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require 'plug-config.nvim-tree'" } -- file manager

  use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } },
    config = "require 'plug-config.telescope'" } -- fuzzy finder

  use { "akinsho/bufferline.nvim", requires = { 'kyazdani42/nvim-web-devicons' }, event = "BufWinEnter",
    config = "require 'plug-config.bufferline'" } -- buffer tabs

  use { "moll/vim-bbye", cmd = "Bdelete" } -- close buffers
  use { "ahmedkhalf/project.nvim", config = "require 'plug-config.project'" } -- Project manager
  --}}}

  --## Visuals (40ms) ## {{{
  -- Colorschemes
  use { "Mofiqul/dracula.nvim", config = "require 'general.colorscheme'" }
  ---- use "lunarvim/colorschemes" use "lunarvim/darkplus.nvim" use "navarasu/onedark.nvim"
  ---- use "ellisonleao/gruvbox.nvim" use "shaunsingh/nord.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = "BufWinEnter",
    config = "require 'plug-config.treesitter'" }
  use { "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" } --rainbow parens
  use { "JoosepAlviste/nvim-ts-context-commentstring", config = "require 'plug-config.comment'",
    after = "nvim-treesitter" } --contextual comments

  use { "goolord/alpha-nvim", config = "require 'plug-config.alpha'" } -- Start page
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  use { "norcalli/nvim-colorizer.lua", config = "require'colorizer'.setup()" } --hex visual colors
  use { "lewis6991/gitsigns.nvim", config = "require 'plug-config.gitsigns'" } --git symbols
  use { "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = "BufWinEnter",
    config = "require 'plug-config.lualine'" }
  use 'kyazdani42/nvim-web-devicons' --extra icons
  use { "lukas-reineke/indent-blankline.nvim", config = "require 'plug-config.indentline'", event = "BufRead" } --indent lines
  --}}}

  -- ## Vanilla (<10ms) ##{{{
  -- Motions
  use "tpope/vim-surround" -- Surround
  use "tpope/vim-commentary" -- Comment
  use "tpope/vim-repeat" -- Repeat

  -- Targets
  use "kana/vim-textobj-user" -- custom text objects
  use "michaeljsmith/vim-indent-object" -- indent (ai, ii)
  use "kana/vim-textobj-entire" -- entire (ae, ie)
  use "kana/vim-textobj-line" -- significant line
  use "wellle/targets.vim"

  ----}}}

  --## Compile ## {{{
  ---- Markdown preview
  --use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
  --  setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
  --  cmd = { 'MarkdownPreview' } })
  -- }}}

  --## Miscellaneous (10ms) ##{{{
  use { "akinsho/toggleterm.nvim", config = "require 'plug-config.toggleterm'" } -- Toggle terminal
  use { "sQVe/sort.nvim", cmd = { 'Sort' } } -- Sort selection
  use { "folke/zen-mode.nvim", cmd = { 'ZenMode' } } -- zen mode
  use { "folke/which-key.nvim", config = "require 'keys.whichkey'" } --key reminder
  --}}}

  --## EOF ## {{{
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
--}}}
