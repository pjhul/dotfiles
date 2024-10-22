syntax on
set incsearch
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set signcolumn=number
set autoindent
set laststatus=2
set hlsearch
set showcmd
set notimeout ttimeout ttimeoutlen=200
set expandtab
set hidden
set ic
set nowrap
set ru
set nobackup
set noswapfile
set cmdheight=2
set cursorline
set encoding=utf-8
set colorcolumn=80


let mapleader = " "

call plug#begin()

Plug 'vim-utils/vim-man'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

  let $FZF_DEFAULT_COMMAND='find . -type f -not -path "*/\.git/*"'
  map ; :FZF<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}

  let g:coc_global_extensions = [
        \ 'coc-svelte',
        \ 'coc-tsserver',
        \ 'coc-json',
        \ 'coc-docker',
        \ 'coc-yaml',
        \ 'coc-css',
        \ 'coc-rust-analyzer',
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
" Plug 'leafOfTree/vim-svelte-plugin'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

  " let g:svelte_indent_script = 1
  " let g:svelte_indent_style = 4
  " let g:svelte_preprocessors = ['typescript']
  let g:vim_svelte_plugin_use_typescript = 1

Plug 'sheerun/vim-polyglot'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

  let g:prettier#autoformat = 1
  let g:prettier#autoformat_require_pragma = 0
  let g:prettier#quickfix_auto_focus = 0
  let g:prettier#quickfix_enabled = 0

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

map <leader>rd <Plug>DrawItStart
map <leader>rs <Plug>DrawItStop

" Insert new line without entering insert
nnoremap <C-J> i<CR><Esc>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nmap <leader>a <Plug>(coc-codeaction-selected)
