if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Don't beep
  set visualbell

  " Start without the toolbar
  set guioptions-=T

  " Shift-select stuff, mac style
  let macvim_hig_shift_movement=1

  " Nice fonts
  set guifont=Source\ Code\ Pro:h13

  " No scrollbars
  set guioptions-=L
  set guioptions-=l
  set guioptions-=R
  set guioptions-=r
  set guioptions-=b
endif
