if filereadable("$HOME/.vimpathogen")
  source $HOME/.vimpathogen
else
  call pathogen#infect()
endif

set nocompatible

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

" Show right margins
let &colorcolumn="81,101"

" enable mouse interaction (with iTerm)
" set mouse=a

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Ignore C headers for tab-completion
" set complete=.,w,b,u,t,i
set complete=.,w,b,u,t

" Status bar
set laststatus=2

" make uses real tabs
au FileType make setlocal noexpandtab

" go uses real tabs
au FileType go setlocal noexpandtab tabstop=2 shiftwidth=2

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" treat Bazel files as python
au BufNewFile,BufRead BUILD,WORKSPACE setlocal filetype=python
au BufWrite BUILD,WORKSPACE :%!buildifier

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use modeline overrides
set modeline
set modelines=10

" Color schemes
let g:jellybeans_overrides = {
\   'LineNr':       { '256ctermfg': '240', '256ctermbg': '235' },
\   'StatusLine':   { '256ctermfg': '15',  '256ctermbg': '21' },
\   'StatusLineNC': { '256ctermfg': '240', '256ctermbg': '235' },
\   'SignColumn':   {                      '256ctermbg': 'Black' },
\   'ColorColumn':  {                      '256ctermbg': '234' }
\ }
let g:jellybeans_background_color_256='none'
set fillchars=vert:\ 
color jellybeans

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup//

" Show (partial) command in the status line
set showcmd

" Keep buffers hidden in the background
set hidden

" Miscellaneous useful bindings
nmap <Leader>. :e#<CR>
nmap <Leader>h :set hlsearch!<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader><Leader> :History<CR>
nmap <Leader>t :Tags<CR>
nmap <c-p> :Files<CR>
imap jj <Esc>

" Working with markdown notes
let g:markdown_folding=1
iabbrev :date: <Esc>"=strftime("%Y%m%d")<CR>pa

" Hilighting for Github-flavoured markdown TODOs
au Filetype markdown syntax match Title " \[ \] "
au Filetype markdown syntax match Comment "\s*- \[[xX]\].*$"
au Filetype markdown syntax match Todo "\s*- \[-\].*$"

" expand ;; in command-line to current file dirname
cabbr <expr> ;; expand('%:h')

" fed up with syntastic noise in HTML templates
let g:syntastic_html_checkers=[]

" Use ag for grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

source $HOME/.vimrc.local
