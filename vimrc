call pathogen#infect()

set nocompatible

set number
set ruler
syntax on

let mapleader=","

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

" Hilight long lines
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength cterm=underline
  autocmd BufEnter * match OverLength /\%81v.*/
augroup END

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

" Status bar
set laststatus=2

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>


" make uses real tabs
au FileType make set noexpandtab

" go uses real tabs
au FileType go set noexpandtab

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

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
\   'StatusLine':   { '256ctermfg': '231', '256ctermbg': '235' },
\   'StatusLineNC': { '256ctermfg': '240', '256ctermbg': '235' },
\   'SignColumn':   {                      '256ctermbg': 'Black' }
\ }
set fillchars=vert:\ 
color jellybeans
map <Leader>l :color raggi<CR>
map <Leader>d :color jellybeans<CR>

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

set t_Co=256

" Miscellaneous useful bindings
nmap <Leader><Leader> :CtrlPMRU<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader>h :set hlsearch!<CR>
nmap <Leader>. :e#<CR>

" Powerline
let g:Powerline_symbols = 'fancy'

" run rspec on current buffer
function! RunSpec(args)
 let cmd = ":! bundle exec rspec " . a:args
 execute cmd
endfunction
map !s :call RunSpec("%:" . <C-r>=line('.')<CR>)<CR>
map !S :call RunSpec("%")<CR>

source $HOME/.vimrc.local
