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

" show relative line numbers
set relativenumber number

" don't break wrapped lines on words
set linebreak

" highlight 80 columns
set cc=80

" enable syntax highlighting
syntax on

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

" enhanced command line completion
set wildmenu
" complete files like a shell
set wildmode=list:longest

" ignore list
set wildignore=vendor/bundle/**,tmp/**,log/**,coverage/**,solr/data,_build/**,deps/**,node_modules/**

" handle multiple buffers better
set hidden

" allow project specific vimrc
set exrc

" vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" vim bundles
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'neomake/neomake'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/kwbdi.vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'docker/docker', {'rtp': 'contrib/syntax/vim/'}
Plugin 'sheerun/vim-polyglot'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist' " required by phoenix.vim
Plugin 'slashmili/alchemist.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'bhurlow/vim-parinfer'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'

" fzf vim extensions
set rtp+=/usr/local/opt/fzf

" All of your Plugins must be added before the following line
call vundle#end()

" enable file type detection
filetype plugin on
" enable filetype-based indentation
filetype indent on

" set color scheme
colorscheme molokai

" enable 256 colors in terminal
set t_Co=256

" enable true colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme="molokai"

" enable JSX syntax highlighting and indentation for .js files
let g:jsx_ext_required = 0

"Y U NO COMMIT
let g:YUNOcommit_after = 60

" change leader key
let mapleader=","

" gutentags cache dir
let g:gutentags_cache_dir = "~/.tags_cache"

" alchemist config
let g:alchemist_tag_disable = 1

" save keystrokes, so we don't need to press the Shift key
nnoremap ; :

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" YankRing mapping
nnoremap <leader>y :YRShow<CR>

" YankRing configs
let g:yankring_history_dir = "~/.vim/tmp"

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

" clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" FZF generic mappings
nmap <silent> <leader>be :Buffers<CR> " navigate through buffers
map <leader>t :Files<CR> " show file list
nnoremap <leader>T :Tags<CR> " show tag list

" FZF mappings for rails
map <leader>rv :Files app/views<cr>
map <leader>rc :Files app/controllers<cr>
map <leader>rm :Files app/models<cr>
map <leader>rh :Files app/helpers<cr>
map <leader>rl :Files lib<cr>
map <leader>rp :Files public<cr>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" map paste/nopaste
map <leader>sp :set paste<cr>
map <leader>snp :set nopaste<cr>

" open rails routes file
map <leader>gr :topleft :split config/routes.rb<cr>

" open ruby Gemfile
map <leader>gg :topleft 100 :split Gemfile<cr>

" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd

" use sudo to write the file
cmap w!! w !sudo tee % >/dev/null

" run the above commands only if vim is compiled with autocmd
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC " apply .vimrc settings on save
  autocmd BufWritePre *.rb,*.html,*.js,*.py,*.ex,*.exs :call <SID>StripTrailingWhitespaces() " remove trailing white spaces before saving (only in specified filetypes)

  autocmd! BufWritePost,BufEnter * Neomake

  " change indentation style for python
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4

  " make a copy of the file and overwrite the original crontab file
  autocmd FileType crontab setlocal bkc=yes

  " change indentation style for golang
  autocmd FileType go setlocal noexpandtab shiftwidth=8 softtabstop=8

  " set filetype for json files
  autocmd BufNewFile,BufRead *.json set ft=json
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

" disable unsafe commands on project specific vimrc
set secure
