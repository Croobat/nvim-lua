--## Setup ## {{{

  local opts = { noremap = true, silent = true }

  local term_opts = { silent = true }

  -- Shorten function name
  local keymap = vim.api.nvim_set_keymap

--}}}

--## Disable mappings ## {{{

  --Remap space as leader key
  keymap("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  --Disable Ex maps
  keymap("", ":q", "<Nop>", opts)
  keymap("n", "Q", "<Nop>", opts)
  keymap("", "<leader>q", "<Nop>", opts)

--}}}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- ## Normal ## -- {{{

  --faster scrolling
  keymap("n", "<C-j>", "5j", opts)
  keymap("n", "<C-k>", "5k", opts)

  -- Better window navigation
  keymap("n", "<A-h>", "<C-w>h", opts)
  keymap("n", "<A-j>", "<C-w>j", opts)
  keymap("n", "<A-k>", "<C-w>k", opts)
  keymap("n", "<A-l>", "<C-w>l", opts)

  -- Explorer
  -- keymap("n", "<leader>e", ":Lex 25<cr>", opts)
  keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

  -- Resize with arrows
  keymap("n", "<C-Up>", ":resize +2<CR>", opts)
  keymap("n", "<C-Down>", ":resize -2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

  -- Navigate buffers
  keymap("n", "<S-l>", ":bnext<CR>", opts)
  keymap("n", "<S-h>", ":bprevious<CR>", opts)

  -- Split long lines
  keymap("n", "Q", "gqq", opts)

  -- Multiline segments
  keymap("n", "j", "gj", opts)
  keymap("n", "k", "gk", opts)

  -- Tab movement
  keymap("n", "<TAB>", ":bnext<CR><CR>", opts)
  keymap("n", "<S-TAB>", ":bprevious<CR><CR>", opts)

  -- Folding
  keymap("n", ",", "za", opts)
  keymap("n", "<leader>m", "<esc>I## {{{<CR>  <backspace><CR>}}}<esc>kkI##  <esc>i", opts)

  -- Insert things
    -- Line
    keymap("n", "<enter>", "o<esc>", opts)
    keymap("n", "<A-enter>", "O<esc>", opts)
    -- Space
    keymap("n", "<leader><leader>", "i <esc>l", opts)
    -- Colon
    keymap("n", "<leader>;", "A;<esc>", opts)
    -- Comma
    keymap("n", "<leader>,", "A,<esc>", opts)

  -- Word Wrap
  keymap("n", "<A-z>", ":set wrap!<CR>", opts)

  -- Better pasting
  keymap("n", "<c-p>", "pg;h", opts)

  -- Telescope
  keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
  keymap("n", "<leader>t", "<cmd>Telescope live_grep theme=ivy<cr>", opts)

  -- Gitsigns
  keymap("n", "<leader>gh", ":Gitsigns next_hunk<cr>", opts)
  keymap("n", "<leader>gH", ":Gitsigns prev_hunk<cr>", opts)
  keymap("n", "<leader>gb", ":Gitsigns blame_line<cr>", opts)

  -- Bbye
  keymap("n", "QQ", ":Bdelete<cr>", opts)

  -- Null-ls (formatting)
  keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting()<cr>", opts)

  -- Toggleterm
  keymap("n", "\\g", ":lua _LAZYGIT_TOGGLE()<cr>", opts)
  keymap("n", "\\n", ":lua _NODE_TOGGLE()<cr>", opts)
  keymap("n", "\\d", ":lua _NCDU_TOGGLE()<cr>", opts)
  keymap("n", "\\h", ":lua _HTOP_TOGGLE()<cr>", opts)
  keymap("n", "\\p", ":lua _PYTHON_TOGGLE()<cr>", opts)

--}}}

--## Insert ## {{{

  -- Insert --
  -- Press jk fast to enter
  keymap("i", "jk", "<ESC>", opts)

  -- Better insert navigation
  keymap("i", "<A-l>", "<ESC>la", opts)
  keymap("i", "<A-h>", "<ESC>ha", opts)
  keymap("i", "<A-j>", "<ESC>ja", opts)
  keymap("i", "<A-k>", "<ESC>ka", opts)

--}}}

--## Visual ## {{{

  -- Stay in indent mode
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- Move text up and down
  keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  keymap("v", "p", '"_dP', opts)

  --faster scrolling
  keymap("v", "<C-j>", "5j", opts)
  keymap("v", "<C-k>", "5k", opts)

--}}}

--## Visual Block ## {{{

  -- Move text up and down
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

  --faster scrolling
  keymap("x", "<C-j>", "5j", opts)
  keymap("x", "<C-k>", "5k", opts)

--}}}

--## Terminal ## {{{

  -- Better terminal navigation
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--}}}
