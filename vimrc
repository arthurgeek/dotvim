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

" auto install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plug.vim setup
call plug#begin('~/.vim/plugged')

" vim bundles
Plug 'tomasr/molokai'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mileszs/ack.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/kwbdi.vim'
Plug 'vim-scripts/IndexedSearch'
Plug 'esneider/YUNOcommit.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'docker/docker', {'rtp': 'contrib/syntax/vim/'}
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required by phoenix.vim
Plug 'slashmili/alchemist.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'bhurlow/vim-parinfer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'thoughtbot/vim-rspec'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'rust-lang/rust.vim'

" Initialize plugin system
" All of your Plugins must be added before the following line
call plug#end()

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

" auto-pairs shortcuts
let g:AutoPairsShortcutFastWrap = '<C-e>'

" save keystrokes, so we don't need to press the Shift key
nnoremap ; :

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" RSpec.vim command
let g:rspec_command = "!bundle exec rspec --drb {spec}"

" RSpec.vim mappings
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>m :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
