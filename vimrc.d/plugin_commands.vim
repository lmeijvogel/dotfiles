nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> - :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

let g:NERDTreeShowRelativeLineNumbers=1
let g:NERDTreeQuitOnOpen=0

" Tag list
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Rebuild tag list
map <A-F8> :!ctags-exuberant --format=2 -R --languages=ruby,javascript --exclude=.git --exclude=log .<CR>
command! Tgenerate :!ctags-exuberant --format=2 -R --languages=ruby,javascript --exclude=.git --exclude=log .

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
else
  let g:ackprg="/usr/bin/ack-grep"
endif

nmap <leader>a :Ack! ""<C-b>
"
" Ack visual selection
vmap <leader>a "vy:Ack! "<C-r>v"
vmap <leader>A "vy:Ack! "<C-r>v"<CR>

" Ack word under cursor
nmap <leader>A viw A

command! Ackf :call AckCurrentFile()<CR>

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

nnoremap <F5> :UndotreeToggle<CR>

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_check_on_open=1
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of .* in void context'}

let g:syntastic_cpp_compiler="g++"
let g:syntastic_cpp_compiler_options=" -std=c++11 -Wall"

nnoremap <leader>st :SyntasticToggleMode<CR>

if !exists('g:config_already_loaded')
  " Do not reset color scheme when reloading the configuration
  let g:config_already_loaded = 1

  set background=dark

  if has('nvim')
    colorscheme railscasts
  endif

  " For nvim-qt, the font size is read from ~/.config/nvim/ginit.vim
  if has("gui_running")
    set guifont=Inconsolata-g\ 13
    GuiFont Input\ Mono:h10
  else
    " Konsole (which I use) does not support cursor shapes, which makes it
    " print extraneous 'q' characters.
    set guicursor=
  endif
endif

" The order is "reversed" (j is previous, k is next) to look more like
" left <-> right
nmap <C-A-k> :bn<CR>
nmap <C-A-j> :bp<CR>


" FZF
nmap <silent> <C-p> :GFiles<CR>

nmap <silent> <F6> :set bg=dark<CR>:colorscheme railscasts<CR>
nmap <silent> <F7> :set bg=light<CR>:colorscheme summerfruit256<CR>

" fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :call GitGuiBlame()<CR>

" Merginal
nmap <leader>gr :Merginal<CR>

" vim-buftabline
" Show buffer number next to buffer name
let g:buftabline_numbers = 1

" Open file from clipboard
nmap <leader>ec :call OpenClipboardFile()<CR>

" Ale
let g:ale_sign_column_always = 1

" The ruby linter for ERB isn't very good, so don't use it.
let g:ale_linters = { 'eruby': [] }

if has('nvim')
  " NeoTerm
  let g:neoterm_position = 'horizontal'
  let g:neoterm_automap_keys = '<leader>tt'


  let test#strategy = "neoterm"
  let test#ruby#rspec#executable = 'sp'
  let test#javascript#jest#executable = 'npm run test'

  nnoremap <silent> <leader>sa :TestSuite<CR>
  nnoremap <silent> <leader>sf :w<CR>:TestFile<CR>
  nnoremap <silent> <leader>sl :w<CR>:TestNearest<CR>
  nnoremap <silent> <leader>S  :w<CR>:TestLast<CR>
  nnoremap <silent> <leader>s <Nop>

  " Automatically enter insert mode in the terminal
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert

  set inccommand=nosplit
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k

  " enable line numbers
  let NERDTreeShowLineNumbers=1
  " make sure relative line numbers are used
  autocmd FileType nerdtree setlocal relativenumber

  nnoremap <silent> <leader>sr :call SwitchTestRunner()<CR>
else
  let g:no_turbux_mappings = 1
  let g:turbux_command_rspec  = "$HOME/bin/sp"
  nmap <leader>sf <Plug>SendTestToTmux
  nmap <leader>sl <Plug>SendFocusedTestToTmux
end

nmap <leader><C-s> <Plug>SetTmuxVars

function! SwitchTestRunner()
  if g:test#strategy  == "neoterm"
    let g:test#strategy = "tslime"
    echo "Sending tests to tslime"
  else
    let g:test#strategy = "neoterm"
    echo "Sending tests to neoterm"
  endif
endfunction

function! GitGuiBlame()
  exec("!git gui blame --line=". line('.') ." \"%\"")
endfunction

function! AckCurrentFile()
  let name = expand('%:t')
  let withoutUnderscore = substitute(name, "^_", "", "")
  let withoutExtension = substitute(withoutUnderscore, "\\..*$", "", "")

  exec "Ack \"". withoutExtension ."\""
endfunction

function! OpenClipboardFile()
  let path=system("xsel -bo")

  let stripped_path = substitute(path, '\n\+$', '', '')

  if filereadable(stripped_path)
    exec("e ". stripped_path)
  else
    echo "File"
    echo "  ". stripped_path
    echo "does not exist!"
  endif
endfunction
