nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

let g:NERDTreeShowRelativeLineNumbers=1
let g:NERDTreeQuitOnOpen=1

" Tag list
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Rebuild tag list
map <A-F8> :!ctags-exuberant -R --languages=ruby,javascript --exclude=.git --exclude=log .<CR>
map <F8> :TagbarToggle<CR>

" Ack.vim
nmap <leader>a :Ack! 
" Ack word under cursor
nmap <leader>A :Ack! <C-R><C-W><CR>

" Ack visual selection
vmap <leader>a "vy:Ack <C-r>v
vmap <leader>A "vy:Ack <C-r>v<CR>

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

let g:ackprg="/usr/bin/ack-grep"
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_check_on_open=1
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of .* in void context'}

nnoremap <leader>st :SyntasticToggleMode<CR>

" Tagbar
nnoremap <F9> :TagbarToggle<CR>

if has("gui_running")
  colorscheme railscasts

  if has("x11")
    set guifont=Inconsolata-g\ 13
  else
    set guifont=Consolas:h13:cANSI
  end
else
endif

set background=dark

" The order is "reversed" (j is previous, k is next) to look more like
" left <-> right
nmap <C-A-k> :bn<CR>
nmap <C-A-j> :bp<CR>

let g:ctrlp_map = '<leader>t'
let g:ctrlp_command='CtrlPMixed'

let g:ctrlp_custom_ignore = 'node_modules\|bower_components'

" Only show MRU files in the current working directory
let g:ctrlp_mruf_relative = 1

let g:no_turbux_mappings = 1
let g:turbux_command_rspec  = 'bin/rspec'
map <leader>s <Plug>SendTestToTmux
map <leader>S <Plug>SendFocusedTestToTmux

nmap <silent> <F6> :set bg=dark<CR>:colorscheme railscasts<CR>
nmap <silent> <F7> :set bg=light<CR>:colorscheme summerfruit256<CR>

" git-gutter
let g:gitgutter_sign_column_always = 1

" fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>

" vim-buftabline
" Show buffer number next to buffer name
let g:buftabline_numbers = 1
