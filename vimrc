" do not use vi compatibility mode
set nocompatible

" show line numbers
set number

" enable syntax highlight
syntax on

" auto detect the type of file that is being edited 
filetype on
" enable filetype plugin
filetype plugin on
" enable filetype-based indentation
filetype indent on

" allow backspacing over everything on insert mode
set backspace=indent,eol,start

" EOL format
set fileformats=unix,mac,dos

" highlight cursor line
set cursorline

" jump to the search term
set incsearch 

" highlight search
set hlsearch

" indent settings
set shiftwidth=2 " number of spaces used for (auto)indent
set expandtab " use soft tabs (spaces)
set softtabstop=2 " size of soft tabs
set autoindent " auto indent lines
set smartindent " smart (language based) auto indent 

" keep 100 cmdline history
set history=100

" backup options
set backup " turn on backup
set backupdir=~/.vim/backup " dir to save backup files
set directory=~/.vim/tmp

" Make the status line more informative
set laststatus=2 " always display status line
set statusline=%<buf:[%n]\ %f\ %h%m%r " buffer, filename, flags
set statusline+=\ \ [
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]\ "
set statusline+=%= " left/right separator 
set statusline+=\ [%3.(%c%) " cursor column
set statusline+=\ %-7.(%l/%L%)] " cursor line/total lines
set statusline+=\ %P " percent through file 

" bash-like tab completion
set wildmenu
set wildmode=list:longest

" set color scheme
colorscheme desert

" run the above commands only if vim is compiled with autocmd
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC " apply .vimrc settings on save
  autocmd BufWritePre *.rb,*.html,*.js,*.py :call <SID>StripTrailingWhitespaces() " remove trailing white spaces before saving (only in specified filetypes)
endif

" function to remove trailing white space (while saving cursor position)
" http://vimcasts.org/episodes/tidying-whitespace/

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

