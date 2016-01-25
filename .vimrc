set nocompatible
set shell=/bin/bash

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mkitt/tabline.vim'
Plug 'tpope/vim-fugitive'
"Plug 'shougo/unite.vim'
"Plug 'ujihisa/unite-colorscheme'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
"Plug 'klen/python-mode', { 'for': 'python' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'cypok/vim-sml', { 'for': 'sml' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'scrooloose/syntastic', { 'for': 'javascript' }
"Plug 'lervag/vimtex', { 'for': 'tex' }
"Plug 'OmniSharp/omnisharp-vim', { 'for': 'csharp' }
"Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
"
" colors
Plug 'christophermca/meta5'
Plug 'zenorocha/dracula-theme', { 'rtp': 'vim' }
Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'noahfrederick/vim-hemisu'
Plug 'gilgigilgil/anderson.vim'
Plug 'romainl/Apprentice'
Plug 'mhinz/vim-janah'
"Plug 'Pychimp/vim-sol'
"Plug 'vim-scripts/plum.vim'
"Plug 'Wutzara/vim-materialtheme'
Plug 'KabbAmine/yowish.vim'
call plug#end()

syntax on

let mapleader=','
let maplocalleader=','

let os = has('win32') ? 'Windows' : substitute(system('uname'), '\n', '', '')
let is_nvim = has('nvim')

if !is_nvim
  set encoding=utf8
endif
set termencoding=utf8


set wildignore=*.pyc,*.o,*.swp,*.jasper,*.pdf,*.exe,*.class,*.out,*.aux
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*/node_modules/*,*/bower_components/*

set history=500
set backspace=eol,start,indent
set colorcolumn=80
set autoread
set number
set lazyredraw
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
set clipboard=unnamedplus

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

set showtabline=2

set background=dark
"colorscheme dracula
"colorscheme onedark
colorscheme janah

" silver searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:go_play_open_browser = 0
let g:go_fmt_command = "goimports"

let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0

if has('python3')
  let g:pymode_python = 'python3'
endif
let g:pymode_folding = 0

" jsx on js files
let g:syntastic_javascript_checkers = ['eslint']

function! ToggleComment()
  if len(getline('.')) == 0
    return
  endif

  let comment_leader = get({
  \  'vim': '"',
  \  'python': '#',
  \  'ruby': '#',
  \  'sh': '#',
  \  'yaml': '#',
  \  'conf': '#',
  \  'dockerfile': '#',
  \  'gitcommit': '#',
  \  'make': '#',
  \  'haskell': '--',
  \  'sql': '--',
  \  'tex': '%',
  \  'mail': '>',
  \  'scheme': ';'
  \}, &filetype, '//')

  let uncomment = matchstr(getline('.'), '^\s*' . comment_leader) != ''

  if uncomment
    execute ":silent! normal :nohl\<CR>:s/\<C-R>=escape(comment_leader, '\/')\<CR>//\<CR>:nohl\<CR>"
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
  "set statusline+=%8*%(\ %<%f%m%r\ %)
  set statusline+=%8*%(\ %<%F%m%r\ %)

  " right alignment
  set statusline+=%=

  " type of file : modified flag : RO flag
  set statusline+=%4*%(\ %{&filetype}\ %)

  " encoding : type
  set statusline+=%5*%(\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}\ %)

  " percentage : line number : col number
  set statusline+=%6*%(\ %p%%\ :\ %l\ :\ %c\ %)

  "hi User1 guibg=#E74C3C guifg=#ffffff ctermbg=1
  "hi User2 guibg=#E67E22 guifg=#ffffff ctermbg=166
  "hi User3 guibg=#F1C40F guifg=#ffffff ctermbg=9
  "hi User4 guibg=#34495E guifg=#ffffff ctermbg=18
  "hi User5 guibg=#9B59B6 guifg=#ffffff ctermbg=129
  "hi User6 guibg=#3498DB guifg=#ffffff ctermbg=26
  "hi User7 guibg=#2ECC71 guifg=#ffffff ctermbg=9
  "hi User8 guibg=#1ABC9C guifg=#ffffff ctermbg=36
  "hi User9 guibg=#95A5A6 guifg=#ffffff ctermbg=9
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

function! GetDisplayResolution()
  let cmd = "xrandr | perl -ne '/current (\\d+) x (\\d+)/ && print \"$1 $2\"'"
  return split(system(cmd))
endfunction

function! ToggleBackground()
  execute 'set background='.{'dark': 'light', 'light': 'dark'}[&background]
endfunction

if has('gui_running')
  let height = GetDisplayResolution()[0]
  let font_size = 10
  let max_height = 1680.0
  if height > max_height
    let font_size = (max_height * font_size) / height
  endif
  set guioptions=ai
  set lines=999
  set columns=999
  if os == 'Linux'
    execute "set guifont=Monaco\\ ".font_size
  else " Windows, Darwin
    execute "set guifont=Monaco:h".font_size
  endif
endif

" clear search
"nmap <Leader><Leader> :nohl<CR>
nmap <silent><Leader><Leader> :let @/ = ""<CR>

" comments
xnoremap <silent><Leader>cc :call ToggleComment()<Return>
nnoremap <silent><Leader>cc :call ToggleComment()<Return>

" move between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" move between buffers
nnoremap <C-PageUp> :bp<CR>
nnoremap <C-PageDown> :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>

" tabs
nmap <C-t> :tabnew<Return>
nmap <C-S-PageUp> :tabprevious<Return>
nmap <C-S-PageDown> :tabnext<Return>

" move tabs ala chrome
" http://stackoverflow.com/a/7192324/94746
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr() - 2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . tabpagenr()<CR>

" fu arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" sizing
noremap <C-right> <C-w>5>
noremap <C-left> <C-w>5<
noremap <C-up> <C-w>5+
noremap <C-down> <C-w>5-

cnoremap w!! w !sudo tee > /dev/null %
noremap <silent><leader>bg :call ToggleBackground()<cr>

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>eh :e /etc/hosts<cr>
nmap <silent> <leader>sv :source $MYVIMRC<cr>

if is_nvim
  let h = winheight(0) * 0.35
  nnoremap <silent><leader>t :execute string(h).'sp term://fish'<cr>

  tnoremap <esc><esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  au WinEnter term://* startinsert
endif

if &term =~ '^screen'
  execute "set <xLeft>=\e[1;*D"
  execute "set <xRight>=\e[1;*C"
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  "execute "set <xPageDown>=\e[6;*"
  "execute "set <xPageUp>=\e[6;"
  ""^[[6;5~
  ""^[[5;5~
endif

augroup ft_config
  au!
  au FileType html setlocal syntax=OFF
  au FileType htmldjango setlocal syntax=OFF
  au FileType jinja setlocal syntax=OFF
  au FileType python setlocal shiftwidth=4 softtabstop=4 nosmartindent
  au FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4 nosmartindent noexpandtab
  au FileType c setlocal shiftwidth=4 softtabstop=4 tabstop=4 nosmartindent noexpandtab
  "au FileType java setlocal shiftwidth=4 softtabstop=4 tabstop=4 nosmartindent noexpandtab
  au FileType java setlocal nosmartindent noexpandtab

  au BufRead,BufNewFile *.es6 setfiletype javascript
  au BufWritePre *.py,*.js,*.rb :silent! %s/\s\+$//
augroup END

augroup reload_vimrc
  au!
  au BufWritePost .vimrc,.nvimrc so $MYVIMRC
augroup END

if !is_nvim
  "autocmd VimResized * =
  autocmd VimResized * wincmd =
endif

call ColorfulStatutLine()

set autochdir
