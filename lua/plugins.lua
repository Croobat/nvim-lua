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

  --## LSP ##{{{
  use { "neovim/nvim-lspconfig", config = "require 'plug-config.lsp'", event = 'BufRead' } -- enable Language Server Protocol
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  use { "hrsh7th/cmp-nvim-lsp" } -- lsp completions


  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  --}}}

  --## Completion ## {{{
  -- auto parens
  use { "windwp/nvim-autopairs", config = "require 'plug-config.autopairs'" }
  use { "windwp/nvim-ts-autotag", event = "InsertEnter" } --autoclose tags
  use { "johmsalas/text-case.nvim", config = function() require('textcase').setup {} end }

  -- cmp
  use { "hrsh7th/nvim-cmp", config = "require 'plug-config.cmp'" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "hrsh7th/cmp-cmdline" } -- cmdline completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lua" } -- lua completions
    use { "David-Kunz/cmp-npm"  } -- npm completions

  -- snippets
  use { "hrsh7th/cmp-vsnip" } -- VScode snippets completions
  use { "hrsh7th/vim-vsnip" } -- VIM VScode snippet completions
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --}}}

  --## Navigation ##{{{
  use { "kyazdani42/nvim-tree.lua", requires = { 'kyazdani42/nvim-web-devicons' }, cmd = "NvimTreeToggle",
    config = "require 'plug-config.nvim-tree'" } -- file manager

  use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } }, cmd = "Telescope",
    config = "require 'plug-config.telescope'" } -- fuzzy finder

  use { "akinsho/bufferline.nvim", requires = { 'kyazdani42/nvim-web-devicons' }, event = "BufWinEnter",
    config = "require 'plug-config.bufferline'" } -- buffer tabs

  use { "moll/vim-bbye", cmd = "Bdelete" } -- close buffers
  use { "ahmedkhalf/project.nvim", config = "require 'plug-config.project'" } -- Project manager
  --}}}

  --## Compile ## {{{
  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
    cmd = { 'MarkdownPreview' } })
  -- }}}

  --## Visuals ## {{{
  -- Colorschemes
  use { "Mofiqul/dracula.nvim", config = "require 'general.colorscheme'" }
  -- use "lunarvim/colorschemes" use "lunarvim/darkplus.nvim" use "navarasu/onedark.nvim"
  -- use "ellisonleao/gruvbox.nvim" use "shaunsingh/nord.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = "BufWinEnter",
    config = "require 'plug-config.treesitter'" }
  use { "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" } --rainbow parens
  use { "JoosepAlviste/nvim-ts-context-commentstring", config = "require 'plug-config.comment'", after = "nvim-treesitter" } --contextual comments

  use { "goolord/alpha-nvim", config = "require 'plug-config.alpha'" } -- Start page
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  use { "norcalli/nvim-colorizer.lua", config = "require'colorizer'.setup()" } --hex visual colors
  use { "lewis6991/gitsigns.nvim", config = "require 'plug-config.gitsigns'" } --git symbols
  use { "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = "BufWinEnter",
    config = "require 'plug-config.lualine'" }
  -- use 'kyazdani42/nvim-web-devicons' --extra icons
  use { "lukas-reineke/indent-blankline.nvim", config = "require 'plug-config.indentline'", event = "BufRead"} --indent lines
  --}}}

  -- ## Vanilla ##{{{
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

  --}}}

  --## Miscellaneous ##{{{
  use { "akinsho/toggleterm.nvim", config = "require 'plug-config.toggleterm'", cmd = "ToggleTerm" } -- Toggle terminal
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
