set nocompatible
syntax on

let mapleader=','
let maplocalleader=','

set shell=/bin/bash

set encoding=utf8
set termencoding=utf8

set wildignore=*.pyc,*.o,*.swp,*.jasper,*.pdf,*.exe,*.class,*.out,*.aux
set wildignore+=*.jpg,*.png,*.gif
set history=100
set backspace=eol,start,indent
set colorcolumn=80
set autoread
set number
set lazyredraw
set encoding=utf8
set termencoding=utf-8
set laststatus=2

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set wrap

" highlight current line
set cursorline

" enable mouse
set mouse=a

" no welcome screen
set shortmess+=I

" don't close buffers, they can be changed w/o being saved
set hidden

" search
set incsearch
set hlsearch
set noignorecase

" backup stuff
set directory=/tmp
set nobackup
set nowritebackup
set noswapfile

" split
set splitbelow
set splitright

" silver searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if has('gui_running')
  set guioptions=ai
  set guifont=Monaco\ 10
  set lines=999
  set columns=999
  try
    set background=dark
    colorscheme pencil
  catch
    set background=light
    silent! colorscheme hemisu
  endtry
else
  set background=dark
  let g:solarized_termtrans = 1
  silent! colorscheme solarized
endif

function! ToggleComment()
  if len(getline('.')) == 0
    return
  endif

  let comment_leader = get({
  \  'vim': '"',
  \  'python': '#',
  \  'ruby': '#',
  \  'sh': '#',
  \  'haskell': '--',
  \  'sql': '--',
  \  'tex': '%',
  \  'mail': '>',
  \  'scheme': ';'
  \}, &filetype, escape('//', '\/'))

  let uncomment = matchstr(getline('.'), '^\s*' . comment_leader) != ''

  if uncomment
    execute ":silent! normal :nohl\<CR>:s/\<C-R>=comment_leader\<CR>//\<CR>:nohl\<CR>"
  else
    execute ":silent! normal ^i\<C-R>=comment_leader\<CR>\<ESC>\<down>^"
  endif
endfunction

function! CurrentMode()
  let current_mode = mode()
  return get({
    \ 'i': 'INSERT',
    \ 'v': 'VISUAL',
    \ 'n': 'NORMAL',
    \ 'R': 'REPLACE',
    \ 'V': 'V-LINE',
    \}, current_mode, current_mode)
endfunction

function! ColorfulStatutLine()
  set statusline=

  " mode
  set statusline+=%1*%(\ \%{CurrentMode()}\ %)

  " buffer number
  set statusline+=%2*%(\ %n\ %)

  " path
  set statusline+=%8*%(\ %<%f%m%r\ %)

  " right alignment
  set statusline+=%= 

  " type of file : modified flag : RO flag
  set statusline+=%4*%(\ %{&filetype}\ %)

  " encoding : type
  set statusline+=%5*%(\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}\ %)

  " percentage : line number : col number
  set statusline+=%6*%(\ %p%%\ :\ %l\ :\ %c\ %)

  hi User1 guibg=#E74C3C guifg=#ffffff ctermbg=1
  hi User2 guibg=#E67E22 guifg=#ffffff ctermbg=166
  hi User3 guibg=#F1C40F guifg=#ffffff ctermbg=9
  hi User4 guibg=#34495E guifg=#ffffff ctermbg=18
  hi User5 guibg=#9B59B6 guifg=#ffffff ctermbg=129
  hi User6 guibg=#3498DB guifg=#ffffff ctermbg=26
  hi User7 guibg=#2ECC71 guifg=#ffffff ctermbg=9
  hi User8 guibg=#1ABC9C guifg=#ffffff ctermbg=36
  hi User9 guibg=#95A5A6 guifg=#ffffff ctermbg=9
endfunction

function! GithubTheme()
  set linespace=1
  set guifont=Liberation\ Mono\ 9
  colorscheme oldgithub
endfunction

function! NoTheme()
  syntax off
  hi LineNr ctermfg=white
endfunction

function! ChangeFontSize(action)
  let groups = matchlist(&guifont, '\v(.+)\s(\d+)$')
  if len(groups) < 3
    return
  endif

  let font_name = groups[1]
  let font_size = groups[2]

  if a:action == '+'
    let font_size += 1
  else
    let font_size -= 1
  endif

  echo font_name . ' ' . font_size
  execute 'set guifont=' . escape(font_name . ' ' . font_size, ' ')
endfunction

" mappings

"nmap <Leader><Leader> :nohl<CR>

" clear search
nmap <silent><Leader><Leader> :let @/ = ""<CR>

" re-source
"nmap <Leader>s :source ~/.config/vim/base.vim<Return>
nmap <Leader>s :execute "source ~/" . (exists(':Plug') ? ".vimrc" : ".config/vim/base.vim")<Return>

" trim lines
nmap <Leader>cs :%s/\s\+$//e<Return>

if !exists('loaded_nerd_comments')
  xnoremap <Leader>cc :call ToggleComment()<Return>
endif

" copy
vnoremap <C-S-c> "+y
nnoremap <C-S-c> "+y

" paste
vnoremap <C-S-v> "+gP
nnoremap <C-S-v> "+gP

" move between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" move between buffers
nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>

" tabs
nmap <C-t> :tabnew<Return>
nmap <C-S-PageUp> :tabprevious<Return>
nmap <C-S-PageDown> :tabnext<Return>
" http://stackoverflow.com/a/7192324/94746
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr() - 2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . tabpagenr()<CR>

" fu arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

au FileType html setlocal syntax=OFF
au FileType htmldjango setlocal syntax=OFF
au FileType jinja setlocal syntax=OFF

au FileType python setlocal shiftwidth=4 softtabstop=4 nosmartindent
au FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4 nosmartindent noexpandtab

set autochdir

"if &statusline == ''
if !exists(':AirlineRefresh')
  call ColorfulStatutLine()
endif
