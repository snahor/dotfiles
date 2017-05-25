" vim: fdm=marker:sw=2:sts=2:et
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
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'

Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'

" snipmate {{{
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" }}}

Plug 'honza/vim-snippets'

" move lines
Plug 'matze/vim-move'

" Plug 'terryma/vim-multiple-cursors'

" window auto resizing
Plug 'roman/golden-ratio'

" Plug 'shougo/unite.vim'
" Plug 'ujihisa/unite-colorscheme'
" Plug 'bfredl/nvim-ipy'

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" async lint engine
Plug 'w0rp/ale'

" langs/syntax {{{
" Plug 'klen/python-mode', { 'for': 'python' }

" vim-polyglot already packs:
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
" Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'sheerun/vim-polyglot'
Plug 'cypok/vim-sml', { 'for': 'sml' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
" haskell {{{
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" }}}

" Plug 'scrooloose/syntastic', { 'for': 'javascript' }
" Plug 'lervag/vimtex', { 'for': 'tex' }
" Plug 'OmniSharp/omnisharp-vim', { 'for': 'csharp' }
" Plug 'lervag/vimtex'

" javascript es6, es7
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
" Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }

" Plug 'sombr/vim-scala-worksheet'

" conceals lambda functions
" Plug 'calebsmith/vim-lambdify'

" }}}

" colors {{{
Plug 'christophermca/meta5'
Plug 'dracula/vim', { 'as': 'dracula-colorscheme' }
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
"Plug 'noahfrederick/vim-hemisu'
Plug 'snahor/vim-hemisu'
Plug 'gilgigilgil/anderson.vim'
Plug 'romainl/Apprentice'
Plug 'mhinz/vim-janah'
"Plug 'Pychimp/vim-sol'
Plug 'vim-scripts/plum.vim'
Plug 'Wutzara/vim-materialtheme'
Plug 'KabbAmine/yowish.vim'
Plug 'ewilazarus/preto'
Plug 'MaxSt/FlatColor'
Plug 'andreasvc/vim-256noir'
Plug 'wellsjo/wellsokai.vim'
Plug 'baskerville/bubblegum'
Plug 'pbrisbin/vim-colors-off'
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/color-scheme-Faded-Black'
Plug 'vim-scripts/ChocolateLiquor'
Plug 'fcpg/vim-fahrenheit'
Plug 'andreasvc/vim-256noir'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'dcapo/friendly-colors'
Plug 'vim-scripts/chlordane.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
"  }}}

call plug#end()

syntax on

let mapleader=','
let maplocalleader=','

let os = has('win32') ? 'Windows' : substitute(system('uname'), '\n', '', '')
let is_nvim = has('nvim')

if !is_nvim
  set encoding=utf8
else
  set termguicolors
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

" always show tabline
set showtabline=2

" folding {{{
set foldclose=all
"set foldlevelstart=99
" }}}

" silver searcher {{{
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }}}

" go {{{
let g:go_play_open_browser = 0
let g:go_fmt_command = "goimports"
" }}}

" ctrlp {{{
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules)$',
  \ }
" }}}

" python {{{
if has('python3')
  let g:pymode_python = 'python3'
endif
let g:pymode_folding = 0
" }}}

" javascript {{{
" jsx on js files
let g:syntastic_javascript_checkers = ['eslint']
" jsbeautify
let g:config_Beautifier = {
\  'js': {
\    'indent_size': 2,
\    'trim_trailing_whitespace': 'true',
\    'indent_style': 'space',
\    'end_of_line': 'lf',
\    'wrap_attributes_indent_size': 4,
\    
\  }
\}
" }}}

" polyglot {{{
let g:polyglot_disabled = ['go', 'yaml', 'python']
"let g:javascript_conceal_arrow_function = "⇒"
" }}}

" slime
let g:slime_target = 'tmux'
" let g:slime_paste_file = tempname()
" let g:slime_paste_file = '/tmp/.slime'
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
let g:slime_python_ipython = 1

setglobal commentstring=#\ %s

" function! Strip(s)
"   return substitute(a:s, '\v\s*(.*)\s*', '\1', '')
" endfunction

" function! ToggleComment()
"   if len(getline('.')) == 0
"     return
"   endif

"   let chars = split(&commentstring, '%s')
"   if len(chars) == 1
"     let comment_leader = Strip(chars[0])
"   endif

"   let uncomment = matchstr(getline('.'), '^\s*' . comment_leader) != ''

"   if uncomment
"     execute ":silent! normal :nohl\<CR>:s/\<C-R>=escape(comment_leader, '\/')\<CR>//\<CR>:nohl\<CR>"
"   else
"     execute ":silent! normal ^i\<C-R>=comment_leader\<CR>\<ESC>\<down>^"
"   endif
" endfunction

let s:modes = {
\ 'i': 'INSERT',
\ 'v': 'VISUAL',
\ 'n': 'NORMAL',
\ 'R': 'REPLACE',
\ 'V': 'V-LINE',
\ 't': 'TERMINAL',
\}

function! CurrentMode()
  let current_mode = mode()
  return get(s:modes, current_mode, current_mode)
endfunction

function! SetUpStatusLine()
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

function! RenameFile(new_name)
  let old_name = expand('%')
  if a:new_name && a:new_name != old_name
    exec 'saveas ' . a:new_name
    exec 'silent !rm ' . old_name
    !redraw
  endif
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
" xnoremap <silent><Leader>cc :call ToggleComment()<Return>
" nnoremap <silent><Leader>cc :call ToggleComment()<Return>

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

" save
nmap <silent> <leader>s :w<cr>

" quit
nmap <silent> <leader>q :q<cr>

augroup go_bindings
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
augroup END

" folding
vnoremap <silent> <leader>f :fold<cr>

command! Q q
command! W w
command! Wq wq

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
  au FileType java setlocal nosmartindent noexpandtab
  au FileType c setlocal shiftwidth=4 softtabstop=4 tabstop=4 nosmartindent noexpandtab commentstring=//\ %s

  au FileType sml setlocal commentstring=(*\ %s\ *)
  au FileType javascript* setlocal commentstring=//\ %s

  au BufRead,BufNewFile *.es6 setfiletype javascript
  au BufWritePre *.py,*.js,*.rb :silent! %s/\s\+$//

  au FileType vim setlocal foldmethod=marker foldlevelstart=0
  au BufNewFile,BufRead {.,}tmux*.conf* setfiletype config
augroup END

augroup reload_vimrc
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

if !is_nvim
  "autocmd VimResized * =
  autocmd VimResized * wincmd =
endif

call SetUpStatusLine()

set background=dark
" colorscheme {{{
" colorscheme dracula
" colorscheme hemisu
colorscheme onedark
" colorscheme flatcolor
" colorscheme pencil
" colorscheme bubblegum
" colorscheme off
" colorscheme plum
" colorscheme onehalflight
" }}}
set autochdir
