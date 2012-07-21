call pathogen#infect()

set nocompatible

set number
set ruler
syntax on

" encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set wrap
set showbreak=»\ \ \ 
set linebreak
set colorcolumn=80

" enable mouse interaction (with iTerm)
set mouse=a

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

" OS X clipboard integration
set clipboard=unnamed

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" make uses real tabs
au FileType make set noexpandtab

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
"if has('gui_running')
    set background=light
"else
"    set background=dark
"endif
color solarized

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

set t_Co=256

nmap <Tab> :CtrlPMRU<CR>

nmap <Leader>t :NERDTree<CR>

" Powerline
let g:Powerline_symbols = 'fancy'

" Execute open rspec buffer
function! RunSpec(args)
 let cmd = ":! bundle exec rspec " . a:args
 execute cmd
endfunction
map !s :call RunSpec("%:" . <C-r>=line('.')<CR>)<CR>
map !S :call RunSpec("%")<CR>
