if has("gui_macvim")
  " Nice fontage
  set gfn=Monaco:h12
  set linespace=4

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>
  map <D-t> :CommandT<CR>
  imap <D-t> <Esc>:CommandT<CR>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Don't beep
  set visualbell

  " Start without the toolbar
  set guioptions-=T
endif
