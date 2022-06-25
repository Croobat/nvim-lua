require "user.options"	        -- general options 6.2ms
require "user.keymaps"          -- key bindings <5ms
require "user.plugins"          -- plugins <5ms
require "user.colorscheme"      -- color scheme <5ms

-- Plugin configurations
-- >10ms
require "user.telescope"        -- fuzzy finder 13.5ms
require "user.nvim-tree"        -- better file explorer 14ms


-- 5-10ms
require "user.lsp"              -- LSP config 6ms
require "user.treesitter"       -- better syntax highlighting 8ms
require "user.autopairs"        -- auto close parens 6ms
require "user.gitsigns"         -- git symbols 6ms
require "user.lualine"          -- custom info line 6.5ms

-- <5ms
require "user.cmp"              -- completion config <5ms
require "user.nvim-colorizer"   -- hex colors <5ms
require "user.comment"          -- smart comments <5ms
require "user.bufferline"       -- buffer tabs <5ms
require "user.toggleterm"       -- toggle terminal <5ms


require "user.project"          -- Project startup page
require "user.impatient"        -- Vim impatient
require "user.indentline"       -- See indent lines
require "user.alpha"            -- Greeter
require "user.whichkey"         -- key helper
require "user.autocommands"     -- Run automatic commands
