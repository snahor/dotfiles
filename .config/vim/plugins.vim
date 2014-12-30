call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'mkitt/tabline.vim'

Plug 'othree/html5.vim' 
Plug 'pangloss/vim-javascript'
Plug 'jcfaria/Vim-R-plugin'
Plug 'groenewege/vim-less'
Plug 'rosstimson/scala-vim-support'
Plug 'mutewinter/nginx.vim'
Plug 'digitaltoad/vim-jade'
Plug 'lepture/vim-jinja'

" colors
Plug 'reedes/vim-colors-pencil'
Plug 'noahfrederick/vim-hemisu'
Plug 'Pychimp/vim-sol'
Plug 'vim-scripts/plum.vim'

Plug 'LaTeX-Box-Team/LaTeX-Box'

Plug 'bling/vim-airline'
Plug 'paranoida/vim-airlineish'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'klen/python-mode'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'cypok/vim-sml', { 'for': 'sml' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
"Plug 'OmniSharp/omnisharp-vim', { 'for': 'csharp' }

call plug#end()

let g:go_play_open_browser = 0
let g:go_fmt_command = "goimports"

let g:UltiSnipsExpandTrigger="<tab>"

let g:user_emmet_settings={ 'indentation': '  ' }

let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_folding = 0
let g:pymode_lint_ignore = "W0401"
let g:pymode_doc = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_show_doc_bind = ''
let g:pymode_rope = 1

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](git|hg|node_modules|bower_components|components|dist)$'
  \}
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline_theme = 'airlineish'
let g:airline_mode_map = {
  \ '__' : '-', 'n'  : 'N', 'i'  : 'I',
  \ 'R'  : 'R', 'c'  : 'C', 'v'  : 'V',
  \ 'V'  : 'V', '' : 'V', 's'  : 'S',
  \ 'S'  : 'S', '' : 'S',
  \ }

