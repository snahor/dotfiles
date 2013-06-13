set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
"Bundle 'kevinw/pyflakes-vim'
Bundle 'vim-scripts/closetag.vim'
Bundle 'Rykka/ColorV'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'ivanov/vim-ipython'
Bundle 'gmarik/github-search.vim'
Bundle 'gmunkhbaatarmn/vim-largefile'
Bundle 'Townk/vim-autoclose'
Bundle 'othree/html5.vim'
" Langs
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'groenewege/vim-less'
" Config
Bundle 'mutewinter/nginx.vim'
"Colors
Bundle 'sickill/vim-monokai'

filetype plugin indent on

" General
set wildignore=*.pyc,*.o,*.swp,*.jasper,*.pdf,*.exe,*.class
set history=100
set backspace=eol,start,indent
set colorcolumn=80
set autoread

" Search
set incsearch
set hlsearch
set noignorecase

" Encoding
set encoding=utf8
set termencoding=utf-8

" Backup
set directory=/tmp
set nobackup
"set nowritebackup
"set noswapfile

" UI
set number
set cursorline

" Format
set tabstop=2
set expandtab " tab to spaces
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set smartindent
set wrap "wrap lines

" Mapping
nmap <C-t> :tabnew<cr>
nmap <C-PageUp> :tabprevious<cr>
nmap <C-PageDown> :tabnext<cr>

" Zen coding
let g:user_zen_settings={
  \ 'indentation': '  '
\}

" Closetag
let b:unaryTagsStack=""

" Powerline
set laststatus=2

" NERDTree
"set NerdTreeIgnore=['\.pyc$']

if has('gui_running')
  set gfn=Monospace\ 9
  "set gfn=Consolas\ 10 linespace=5
  set guioptions-=T
  set columns=100
  set lines=40
  set t_Co=256
  "colorscheme gummybears
  "colorscheme wombat
  "colorscheme jellybeans
  "set background=dark
  "colorscheme solarized
  colorscheme bclear
  "colorscheme mustang
  if has('gui_macvim')
    set gfn=Monaco:h10
  else
    syntax off
    "set gfn=DejaVu\ Sans\ Mono\ 10
    set gfn=Monaco\ 9 linespace=1
    cd ~
  endif
else
    colorscheme xoria256
endif

au FileType python setlocal expandtab shiftwidth=4 softtabstop=4

"au FileType html setlocal shiftwidth=2 tabstop=2
"au FileType htmldjango setlocal shiftwidth=2 tabstop=2
"au FileType xml setlocal shiftwidth=2 tabstop=2
"au FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
"au FileType css setlocal expandtab shiftwidth=2 softtabstop=2
"au FileType less setlocal expandtab shiftwidth=2 softtabstop=2
"au FileType coffee setlocal expandtab shiftwidth=2 softtabstop=2
"au FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
"au FileType sql setlocal expandtab shiftwidth=2 softtabstop=2

set autochdir

