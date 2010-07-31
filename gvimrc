" font family and font size.
set guifont=Menlo:h13

" smooth fonts.
set antialias

" use UTF-8 everywhere.
set encoding=utf-8

" hide toolbar.
set guioptions-=T

" don't show right scrollbar
set guioptions-=r

" make PeepOpen work with Cmd-T
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
end
