set nocompatible

call plug#begin()
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Raimondi/delimitMate'
Plug 'davidoc/taskpaper.vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'muz/vim-gemfile'
Plug 'mvanderkamp/cocoa.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'oesmith/vim-java-imports'
Plug 'pangloss/vim-javascript'
Plug 'pbogut/fzf-mru.vim'
Plug 'prabirshrestha/async.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
call plug#end()

set number
set ruler
syntax on

let mapleader="\<Space>"

" encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:‣\ ,trail:×,eol:¬
set wrap
set showbreak=»\ \ \ 
set linebreak
set nojoinspaces

" Faster scrolling over SSH
set scrolljump=10

" Show right margins
let &colorcolumn="81,101"

" Use a space character for the separator between vertical splits.
set fillchars=vert:\ 

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Ignore C headers for tab-completion
" set complete=.,w,b,u,t,i (defaults)
set complete=.,w,b,u,t

" Status bar
set laststatus=2

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup//

" Show (partial) command in the status line
set showcmd

" Keep buffers hidden in the background
set hidden

" True color support
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Load the plugin and indent settings for the detected filetype
filetype plugin indent on

" make uses real tabs
au FileType make setlocal noexpandtab

" go uses real tabs
au FileType go setlocal noexpandtab tabstop=2 shiftwidth=2

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Hilighting for Github-flavoured markdown TODOs
au Filetype markdown syntax match Title " \[ \] "
au Filetype markdown syntax match Comment "\s*- \[[xX]\].*$"
au Filetype markdown syntax match Todo "\s*- \[-\].*$"

" fed up with syntastic noise in HTML templates
let g:syntastic_html_checkers=[]

" Color schemes
let g:jellybeans_overrides = {
\   'LineNr':       { 'guifg': '585858', 'guibg': '262626', '256ctermfg': '240', '256ctermbg': '235' },
\   'StatusLine':   { 'guifg': 'ffffff', 'guibg': 'af5f00', '256ctermfg': '15',  '256ctermbg': '94' },
\   'StatusLineNC': { 'guifg': '585858', 'guibg': '262626', '256ctermfg': '240', '256ctermbg': '235' },
\   'SignColumn':   {                    'guibg': '000000',                      '256ctermbg': 'Black' },
\   'ColorColumn':  {                    'guibg': '262626',                      '256ctermbg': '235' },
\   'background':   {                    'guibg': 'none' }
\ }
let g:jellybeans_use_term_italics = 1
let g:gruvbox_bold = 0
let g:gruvbox_italic = 1
color jellybeans
nmap <Leader>d :set background=dark<CR>:color jellybeans<CR>
nmap <Leader>l :set background=light<CR>:color industry<CR>

" Expand ;; in command-line to current file dirname
cabbr <expr> ;; fnamemodify(expand('%:h'), ':.')

" Miscellaneous useful bindings
nmap <Leader>. :e#<CR>
nmap <Leader>h :set hlsearch!<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader><Leader> :FZFMru<CR>
nmap <Leader>t :Tags<CR>
nmap <C-p> :Files<CR>
imap jj <Esc>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ag for grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if filereadable('/usr/share/doc/fzf/examples/fzf.vim')
  source /usr/share/doc/fzf/examples/fzf.vim
endif

source $HOME/.vimrc.local
