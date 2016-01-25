nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

let g:NERDTreeShowRelativeLineNumbers=1
let g:NERDTreeQuitOnOpen=1

" Tag list
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Rebuild tag list
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Ack.vim
nmap <leader>a :Ack! 
" Ack word under cursor
nmap <leader>A :Ack! <C-R><C-W><CR>

" Disable 'h' mapping that interferes with navigation
" These are the default mappings, but with 'h' removed.
let g:ack_mappings = {
      \ "t": "<C-W><CR><C-W>T",
      \ "T": "<C-W><CR><C-W>TgT<C-W>j",
      \ "o": "<CR>",
      \ "O": "<CR><C-W><C-W>:ccl<CR>",
      \ "go": "<CR><C-W>j",
      \ "H": "<C-W><CR><C-W>K<C-W>b",
      \ "v": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
      \ "gv": "<C-W><CR><C-W>H<C-W>b<C-W>J" }
"
" Gundo
nnoremap <F5> :GundoToggle<CR>

" Yaml tools
nmap <silent> <leader>u :YamlGoToParent<CR>
nmap <leader>y :YamlGetFullPath<CR>
nmap <leader>Y :YamlGoToKey 

" Buffet
nmap <silent> <leader>be :Bufferlist<CR>

" EasyAlign
vmap <Leader>e :EasyAlign=<CR>
vmap <Leader>E :EasyAlign

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
let g:ScreenShellTerminal = 'konsole'


if has("gui_running")
  colorscheme railscasts
  set background=dark

  if has("x11")
    set guifont=Inconsolata\ 11
  else
    set guifont=Consolas:h11:cANSI
  end
else
  set background=dark
endif

" The order is "reversed" (j is previous, k is next) to look more like
" left <-> right
nmap <C-A-k> :bn<CR>
nmap <C-A-j> :bp<CR>

let g:ctrlp_map = ''
nnoremap <leader>t :CtrlPCurWD<CR>
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'

let g:no_turbux_mappings = 1
let g:turbux_command_rspec  = 'bin/rspec'
map <leader>s <Plug>SendTestToTmux
map <leader>S <Plug>SendFocusedTestToTmux

" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

nmap <silent> <F6> :set bg=dark<CR>:colorscheme railscasts<CR>
nmap <silent> <F7> :set bg=light<CR>:colorscheme summerfruit256<CR>

" git-gutter
let g:gitgutter_sign_column_always = 1
