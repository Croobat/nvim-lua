 vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd VimResized * tabdo wincmd =
    autocmd BufWritePre * %s/\s\+$//e
    autocmd Filetype * set whichwrap+=<,>,[,],h,l
    autocmd FileType * setlocal formatoptions-=cro
    autocmd FileType * set splitbelow splitright
  augroup end

  augroup _man_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _vimwiki
    autocmd!
    autocmd Filetype wiki TSBufDisable indent
    autocmd Filetype wiki set wrap
    autocmd Filetype wiki set linebreak
    autocmd BufWritePre *.wiki %global/\%>85v/normal! gqq
  augroup end

  augroup _tex
    autocmd!
    autocmd Filetype tex set wrap
    autocmd Filetype tex set linebreak
  augroup end
]]

-- vim.cmd "set whichwrap+=<,>,[,],h,l" 		                  -- More wraps
-- vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]] -- Disable autocoment
