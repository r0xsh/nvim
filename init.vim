" GENERAL
" ====>
  " Smart indentation
  set autoindent
  set smartindent

  " Tab stops
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab

  " Unicode
  set encoding=utf-8

  " Highlight matching brace/parenthese/bracket
  set showmatch

  " Visual bell
  set vb t_vb=
  set novisualbell

  " Watch for file changes
  set autoread

  " Backup files
  set nobackup
  set nowb
  set noswapfile

  " Set <Leader> key
  let  mapleader = ','
  let g:mapleader = ','

  set nocompatible
  filetype indent plugin on
  set clipboard=unnamedplus
" ====<



" PLUGINS
" ====>
call plug#begin('~/.config/nvim/plugged')
  Plug 'mbbill/undotree'
  Plug 'raimondi/delimitmate'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'kien/ctrlp.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'sebastianmarkow/deoplete-rust'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'scrooloose/nerdcommenter'
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/lightline.vim'
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'w0rp/ale'
  Plug 'posva/vim-vue'
  Plug 'majutsushi/tagbar'
  Plug 'baverman/vial'
  Plug 'baverman/vial-http'
  Plug 'thiagoalessio/rainbow_levels.vim'
call plug#end()

  " Undootree config
  map	<leader>y	:UndotreeToggle<CR>
  if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
  endif

  " Nerdtree config
  map <leader>o :NERDTreeToggle<CR>
  augroup Nerdtree
    au!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
  let g:NERDTreeShowBookmarks = 1

  " Ale config
  let g:ale_sign_error = '>'
  let g:ale_sign_warning = '-'
  let g:ale_set_highlights = 0
  let g:ale_fixers = {
  \   'rust': ['cargo'],
  \   'vue':  ['prettier'],
  \   'javascript': ['eslint', 'prettier']
  \}


  " Ctrl P
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
  let g:ctrlp_user_command = 'fd --full-path %s --type f'

  " Tagbar config
  map <Leader>p :TagbarToggle<CR>
  let g:tagbar_type_rust = {
         \ 'ctagstype' : 'rust',
         \ 'kinds' : [
         \'T:types,type definitions',
         \'f:functions,function definitions',
         \'g:enum,enumeration names',
         \'s:structure names',
         \'m:modules,module names',
         \'c:consts,static constants',
         \'t:traits,traits',
         \'i:impls,trait implementations',
         \]
    \}

  " Deopleted
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#rust#racer_binary=$CARGO_BIN_PATH
	let g:deoplete#sources#rust#rust_source_path=$RUST_SRC_PATH
  let g:deoplete#sources#ternjs#tern_bin=$TERNJS_BIN_PATH

  let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

" ====<



" SPELL CHECKING
" ====>
  " Turn off spell checking (colors made text unreadable)
  set nospell
  set spelllang=en,fr

  " Show only 9 suggestions for misspelled words
  set spellsuggest=9
" ====<



" SEARCH
" ====>
  " Incremental search with ignore case (except explicit caps)
  set incsearch
  set ignorecase
  set smartcase
  set showmatch
  set hlsearch

  " Clear search highlighting
  "nnoremap <leader><space> :noh<cr>

  " Search highlighting
  set hls
  "set nohls

  " Center search results while browsing
  map N Nzz
  map n nzz
" ====<



" DECORATION
" ====>
  " Turn on line numbering
  set number relativenumber
  set numberwidth=1

  " Highlight curret line
  set cursorline

  " Set colorsheme
  color dracula

  " Enable colosheme
  syntax on
" ====<



" STATUSBAR
" ====>
  set laststatus=2

  let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
        \ 'subseparator': { 'left': '▒', 'right': '░' },
        \  'active': {
        \   'right': [ [ 'lineinfo' ],
        \              [ 'fileformat', 'fileencoding', 'filetype', 'alecheck' ] ]
        \ },
        \ 'component_function' : {
        \   'alecheck': 'LinterStatus'
        \}
  \ }
" ====<



" SAVING
" ====>
  " Save with ctrl+s
  map   <c-s> <esc>:w<cr>
  imap  <c-s> <c-o><c-s>
  imap  <c-s> <esc><c-s>
" ====<



" MOTIONS
" ====>
  " Move a line of text using ALT+[jk] (Comamnd+[jk] on mac)
  nmap <silent> <M-j> mz:m+<cr>`z
  nmap <silent> <M-k> mz:m-2<cr>`z
  vmap <silent> <M-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <silent> <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

  " Move up and down by screen lines, not file lines
  nnoremap j gj
  nnoremap k gk

  " Keep at least 3 lines above/below
  set scrolloff=3

  " Keep at least 2 lines left/right
  set sidescrolloff=2

  " Enable mouse support
  set mouse=a

  " Move over buffers with tab
  noremap <S-Tab>		:bprevious<CR>
  noremap <Tab>			:bnext<CR>
" ====<

 " LinterStatus for lightline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
