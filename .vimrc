Plug 'junegunn/fzf.vim'

  let $FZF_DEFAULT_COMMAND='find . -type f -not -path "*/\.git/*"'
  map ; :FZF<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}

  let g:coc_global_extensions = [
        \ 'coc-svelte',
        \ 'coc-tsserver',
        \ 'coc-json',
        \ 'coc-yaml',
        \ 'coc-css',
        \ 'coc-html'
    \ ]
  " GoTo Code Navigation
  nmap <leader>gd <Plug>(coc-definition)
  nmap <leader>gy <Plug>(coc-type-definition)
  nmap <leader>gi <Plug>(coc-implementation)
  nmap <leader>gr <Plug>(coc-reference)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  nmap <leader>f  <Plug>(coc-format-selected)

Plug 'peitalin/vim-jsx-typescript'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-scripts/DrawIt'

" Go plugins
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " let g:go_fmt_autosave = 0

" Elixir plugins
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'

" Svelte plugins
Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}

  " let g:svelte_indent_script = 1
  " let g:svelte_indent_style = 4
  " let g:svelte_preprocessors = ['typescript']
  let g:vim_svelte_plugin_use_typescript = 1

Plug 'sheerun/vim-polyglot'

call plug#end()

colorscheme gruvbox
set bg=dark

" Highlight trailing whitespace per https://bit.ly/35RTov2.
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

" Move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

nnoremap <leader>U :UndotreeShow<CR>
nmap <silent> <leader>u <C-u>
nmap <silent> <leader>d <C-d>

inoremap jj <ESC>

map <unique> <leader>rd <Plug>DrawItStart
map <unique> <leader>rs <Plug>DrawItStop

" Insert new line without entering insert
nnoremap <C-J> i<CR><Esc>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

nmap <leader>a <Plug>(coc-codeaction-selected)
