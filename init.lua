require "user.options"	        -- General options 6.2ms
require "user.keymaps"          -- Key bindings <5ms
require "user.plugins"          -- Plugins <5ms
require "user.colorscheme"      -- Color scheme <5ms

-- Plugin configurations
-- >10ms
require "user.telescope"        -- Fuzzy finder 13.5ms
require "user.nvim-tree"        -- better file explorer 14ms


-- 5-10ms
require "user.lsp"              -- LSP config 6ms
require "user.treesitter"       -- Better syntax highlighting 8ms
require "user.autopairs"        -- Auto close parens 6ms
require "user.gitsigns"         -- Git symbols 6ms
require "user.lualine"          -- custom info line 6.5ms

-- <5ms
require "user.cmp"              -- Completion config <5ms
require "user.nvim-colorizer"   -- Hex colors <5ms
require "user.comment"          -- Smart comments <5ms
require "user.bufferline"       -- buffer tabs <5ms
require "user.toggleterm"       -- toggle terminal <5ms
