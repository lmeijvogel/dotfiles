nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

let g:NERDTreeShowRelativeLineNumbers=1

" Tag list
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Rebuild tag list
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Ack.vim
nmap <leader>a :Ack 
" Ack word under cursor
nmap <leader>A :Ack! <C-R><C-W><CR>

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

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': ['puppet'] }
let g:syntastic_check_on_open=1

" Tagbar
nnoremap <F9> :TagbarToggle<CR>

" Screen
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'vim'
let g:ScreenShellQuitOnVimExit = 0
let g:ScreenShellTerminal = 'terminal'
map <F6> :ScreenShell<CR>

nmap <leader>s :call RunCurrentTest()<CR>
nmap <leader>S :call RunCurrentLineInTest()<CR>
imap <C-s> <Esc>:call RunCurrentLineInTest()<CR>a
nmap <leader>r :call RunCurrentFile()<CR>

let g:TestRunnerStartScreenShell = 1

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

" Command-T
let g:CommandTCancelMap=['<Esc>', '<C-c>']

" The order is "reversed" (j is previous, k is next) to look more like
" left <-> right
nmap <C-A-k> :bn<CR>
nmap <C-A-j> :bp<CR>

let g:ctrlp_map = ''
nnoremap <leader>t :CtrlPCurWD<CR>

let g:startify_change_to_dir = 0

