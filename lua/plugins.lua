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

  --   PLUGINS{{{
  -- ## Mandatory ## {{{
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "lewis6991/impatient.nvim" -- Faster startup
  -- }}}

  --## LSP ##{{{
  use "neovim/nvim-lspconfig" -- enable Language Server Protocol
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  --}}}

  --## Completion ## {{{
  -- auto parens
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use "windwp/nvim-ts-autotag" --autoclose tags
  -- auto case
  use { "johmsalas/text-case.nvim", config = function() require('textcase').setup {} end }

  -- nvim-cmp
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "David-Kunz/cmp-npm" -- npm completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  use "hrsh7th/cmp-nvim-lua" -- lua completions
  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --}}}

  --## Navigation ##{{{
  use "kyazdani42/nvim-tree.lua"  -- tree fm
  use "ahmedkhalf/project.nvim" -- Project manager
  use "nvim-telescope/telescope.nvim"  -- Fuzzy finder
  use "akinsho/bufferline.nvim" -- buffer tabs
  use { "moll/vim-bbye", cmd = "Bdelete" } -- close buffers
  --}}}

  --## Compile ## {{{
  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
    cmd = { 'MarkdownPreview' }})
  -- }}}

  --## Visuals ## {{{
  -- Colorschemes
  use "Mofiqul/dracula.nvim"
  -- use "lunarvim/colorschemes" use "lunarvim/darkplus.nvim" use "navarasu/onedark.nvim"
  -- use "ellisonleao/gruvbox.nvim" use "shaunsingh/nord.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    use "p00f/nvim-ts-rainbow" --rainbow parens
    use "JoosepAlviste/nvim-ts-context-commentstring" --contextual comments

  use "goolord/alpha-nvim" -- Start page
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  use "norcalli/nvim-colorizer.lua" --hex visual colors
  use "lewis6991/gitsigns.nvim" --git symbols
  use 'kyazdani42/nvim-web-devicons' --extra icons
  use "nvim-lualine/lualine.nvim" --custom info line
  use "lukas-reineke/indent-blankline.nvim" --indent lines
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
  use { "akinsho/toggleterm.nvim", 
    cmd = {'ToggleTerm'},
    requires = {'user.toggleterm'}  
  } -- Toggle terminal
  use { "sQVe/sort.nvim", cmd = {'Sort'} } -- Sort selection
  use { "folke/zen-mode.nvim", cmd = {'ZenMode'} }-- zen mode
  use "folke/which-key.nvim" --key reminder
  --}}}
--}}}

  --## EOF ## {{{
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
--}}}
