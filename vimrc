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

" ignore case while searching except if there's an uppercase letter
set ignorecase smartcase

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

" tab navigation
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR> 

" bash-like tab completion
set wildmenu
set wildmode=list:longest

" automatically create hidden buffers
set hidden

" set color scheme
colorscheme xoria256

" change leader key
let mapleader=","

" shortcut for opening files located in the same directory as the current file
" http://vimcasts.org/episodes/the-edit-command/

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR> " open in window
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR> " open in split
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR> " open in vertical split
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR> " open in tab

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

