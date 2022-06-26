require "general.options"	        -- general options <5ms
require "general.colorscheme"      -- color scheme 7ms
-- require "autorun.autocommands"     -- Run automatic commands <5ms
require "keys.keymaps"          -- key bindings <5ms

require "plugins"          -- plugins <5ms
-- Plugin configurations
-- >10ms
require "plug-config.nvim-tree"        -- better file explorer 14ms
require "plug-config.lsp"              -- LSP config 10ms


-- 5-10ms
require "plug-config.alpha"            -- Greeter 10ms
require "plug-config.gitsigns"         -- git symbols 9ms
require "plug-config.treesitter"       -- better syntax highlighting 8ms
require "plug-config.autopairs"        -- auto close parens 8ms
require "plug-config.cmp"              -- completion config 8ms
require "plug-config.telescope"        -- fuzzy finder 7 ms
require "plug-config.nvim-colorizer"   -- hex colors 7ms
require "plug-config.project"          -- Project startup page 7ms
require "keys.whichkey"                -- key helper 7 ms

-- <5ms
require "plug-config.lualine"          -- custom info line <5ms
require "plug-config.comment"          -- smart comments <5ms
require "plug-config.bufferline"       -- buffer tabs <5ms
require "plug-config.toggleterm"       -- toggle terminal <5ms
require "plug-config.indentline"       -- See indent lines <5ms
require "plug-config.impatient"        -- Vim impatient
