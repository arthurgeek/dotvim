" do not use vi compatibility mode. must come first because it changes other options.
set nocompatible

" show incomplete commands
set showcmd

" show invisibles
set list

" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" show line numbers
set number

" use relative line numbers
set relativenumber

" don't break wrapped lines on words
set linebreak

" enable syntax highlighting
syntax on

" auto detect the type of file that is being edited 
filetype on
" enable file type detection
filetype plugin on
" enable filetype-based indentation
filetype indent on

" intuitive backspacing
set backspace=indent,eol,start

" EOL format
set fileformats=unix,mac,dos

" highlight cursor line
set cursorline

" highlight matches as you type
set incsearch 

" highlight matches
set hlsearch

" show 3 lines of context around the cursor
set scrolloff=3

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

" persistent undo
set undofile
set undodir=~/.vim/tmp

" backup options
set backup " turn on backup
set backupdir=~/.vim/backup " dir to save backup files
set directory=~/.vim/tmp " dir to keep all swap files

" show status line all the time
set laststatus=2

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{GitBranchInfoString()}\ %=%-16(\ %l,%c-%v\ %)%P

" enhanced command line completion
set wildmenu
" complete files like a shell
set wildmode=list:longest

" handle multiple buffers better
set hidden

" set color scheme
colorscheme molokai

" enable 256 colors in terminal
set t_Co=256

" change leader key
let mapleader=","

" save keystrokes, so we don't need to press the Shift key
nnoremap ; :

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" YankRing mapping
nnoremap <leader>y :YRShow<CR>

" clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd

" use sudo to write the file
cmap w!! w !sudo tee % >/dev/null

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

" function to delete all hidden buffers
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" mapping for function above
map <leader>bw :call Wipeout()<CR>
