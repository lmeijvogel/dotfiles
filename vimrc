set nocompatible

let g:snippets_dir="~/.vim/snippets"
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set mouse=a

" Hide menubar and toolbar in gvim
set guioptions-=m
set guioptions-=T
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

let g:NERDTreeShowRelativeLineNumbers=1

" No beeps or flashes on errors
set noerrorbells
set novisualbell
set t_vb=
"
" Quickly clear search history
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly select next and previous search results
nmap <silent> <C-A-n> :cn<CR>
nmap <silent> <C-A-p> :cp<CR>

" Sudo write current file
cmap w!! w !sudo tee % >/dev/null
set nowrap

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab " Insert tabs at start of a line according to shiftwidth instead of tabstop

set backspace=indent,eol,start " Allow backspace over anything

set ignorecase " Ignore case when searching
set smartcase " Except when uppercase characters are given

set showmode " Show in which mode (command/insert/... vim is operating)

set foldenable
set fdm=indent
set foldlevelstart=99 " Start with all files unfolded

syntax on

set scrolloff=3 " Always show 3 lines above and below cursor
set sidescrolloff=20
set sidescroll=15

set key= " Disable encryption

" Add WildMenu for easier tab completion of filenames
set wildmenu

set incsearch " Incremental search
set hlsearch " Highlight search terms

set showmatch " Show matching parentheses

set autoindent " Always enable autoindent
set copyindent " Copy the previous indentation on autoindenting

" Disable error bells
set t_vb=
set noerrorbells " don't beep

set wildignore=*.swp,*.bak,*.pyc,*.class,*.orig,*.scssc
set wildignore+=public/drive/**,private/**,webdav/private/**,webdav/public/drive/**

set history=1000
set undolevels=1000

set nobackup
set noswapfile
set hidden " Allow hidden unsaved buffers

filetype plugin indent on

highlight overlength NONE

" Make S-y consistent with S-d etc.
nmap <silent> Y y$
set cursorline
set ruler
set relativenumber " Relative line numbers for (sometimes) easier navigation

" Disallow window resizing
set winfixwidth

" Mistyping F1 instead of ESC is annoying
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Easier movements: C-hjkl to move between splits
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Copy filename:line_number to clipboard
map <silent> <leader>fl :let @+ = expand("%:p").':'.line('.')<CR>
map <silent> <leader>ff :let @+ = expand("%:p")<CR>

" Easily create splits
nmap <silent> ss <C-w>s
nmap <silent> vv <C-w>v

" Easily resize splits
nmap <silent> <Up> <C-w>+
nmap <silent> <Down> <C-w>-
nmap <silent> <Left> <C-w><
nmap <silent> <Right> <C-w>>
nmap <silent> <S-Up> <C-w>8+
nmap <silent> <S-Down> <C-w>8-
nmap <silent> <S-Left> <C-w>8<
nmap <silent> <S-Right> <C-w>8>

" Map space to : in normal mode
nmap <Space> :

" Map <Tab> to <Esc>
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

" Tag list
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
" Rebuild tag list
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Delete trailing whitespace
nmap <silent> <leader>dtw :s/\s*$//<CR>:noh<CR>
nmap <silent> <leader>gdtw :%s/\s*$//<CR>:noh<CR>
" Alias for gdtw
map <F4> :%s/\s*$//<CR>:noh<CR>

nmap <silent> <leader>gb :!git gui blame %<CR>
nmap <silent> <leader>gs :Gstatus<CR>

nmap <leader>a :Ack 
" Ack word under cursor
nmap <leader>A :Ack! <C-R><C-W><CR>
"
" Save all files when Vim loses focus
au FocusLost * silent! :wa

" LustyJuggler
let g:LustyJugglerShowKeys = 'a' " Show alphabetic keys
nmap <leader>j :LustyJuggler<CR>

" Start LustyJuggler on the second (MRU) buffer
let g:LustyJugglerAltTabMode = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Yaml tools
nmap <silent> <leader>u :YamlGoToParent<CR>
nmap <leader>y :YamlGetFullPath<CR>
nmap <leader>Y :YamlGoToKey 

" Buffet
nmap <silent> <leader>be :Bufferlist<CR>

" Statusline
set laststatus=2 " Always show status line
set statusline=[%n]\ %f\ %m\ %y%=%l,%c\ %P

" Replace Ruby rocket syntax with keyvalue syntax
nmap <leader>r :%s/:\([a-z0-9_]\{1,\}[!?]\?\) \?=>/\1:/g<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': ['puppet'] }
let g:syntastic_check_on_open=1

if has("gui_running")
  colorscheme railscasts

  if has("x11")
    set guifont=Liberation\ Mono\ 10
  else
    set guifont=Consolas:h11:cANSI
  end
else
  set background=dark
endif

" Experimental: rails.vim shortcuts
inoremap <C-s> ^X^U
" Add tab number to tab
set guitablabel=%N)\ %t\ %M
