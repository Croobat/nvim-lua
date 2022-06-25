require "user.options"	        -- general options <5ms
require "user.keymaps"          -- key bindings <5ms
require "user.plugins"          -- plugins <5ms
require "user.colorscheme"      -- color scheme 7ms

-- Plugin configurations
-- >10ms
require "user.nvim-tree"        -- better file explorer 14ms
require "user.lsp"              -- LSP config 10ms


-- 5-10ms
require "user.alpha"            -- Greeter 10ms
require "user.gitsigns"         -- git symbols 9ms
require "user.treesitter"       -- better syntax highlighting 8ms
require "user.autopairs"        -- auto close parens 8ms
require "user.cmp"              -- completion config 8ms
require "user.telescope"        -- fuzzy finder 7 ms
require "user.nvim-colorizer"   -- hex colors 7ms
require "user.project"          -- Project startup page 7ms
require "user.whichkey"         -- key helper 7 ms

-- <5ms
require "user.lualine"          -- custom info line <5ms
require "user.comment"          -- smart comments <5ms
require "user.bufferline"       -- buffer tabs <5ms
require "user.toggleterm"       -- toggle terminal <5ms
require "user.indentline"       -- See indent lines <5ms
require "user.autocommands"     -- Run automatic commands <5ms
require "user.impatient"        -- Vim impatient
