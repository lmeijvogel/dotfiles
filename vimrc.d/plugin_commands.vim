source ~/.vimrc.d/plugins/vim-grepper.vim
source ~/.vimrc.d/plugins/coc.nvim.vim
source ~/.vimrc.d/plugins/nerdtree.vim

" Tag list
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Rebuild tag list
command! LMGenerateTags :!ctags-exuberant --format=2 -R --exclude=.git --exclude=log .

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

" The order is "reversed" (j is previous, k is next) to look more like
" left <-> right
nmap <C-A-k> :bn<CR>
nmap <C-A-j> :bp<CR>

" FZF
nmap <silent> <C-p> :GFiles<CR>
nmap <silent> <leader>h :History<CR>
nmap - :Buffers<CR>

" Color schemes
nmap <silent> <F6> :call LMBackgroundDark()<CR>
nmap <silent> <F7> :call LMBackgroundLight()<CR>

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

" NERDCommenter - space after comment delimiters
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

if has('nvim')
  " NeoTerm
  let g:neoterm_default_mod = 'horizontal'
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

let g:prettier#exec_cmd_path = getcwd() . "/node_modules/.bin/prettier-eslint"

function! LMBackgroundLight()
  hi link BufTabLineCurrent TabLineSel
  hi link BufTabLineActive  TabLine
  hi link BufTabLineHidden  PmenuSel
  hi link BufTabLineFill    TabLineFill

  set background=light

  colorscheme one
endfunction

function! LMBackgroundDark()
  hi link BufTabLineCurrent PmenuSel
  hi link BufTabLineActive  TabLineSel
  hi link BufTabLineHidden  TabLine
  hi link BufTabLineFill    TabLineFill

  set background=dark

  colorscheme molokayo

  if (has("termguicolors"))
    set termguicolors
  endif
endfunction

if !exists('g:config_already_loaded')
  " Do not reset color scheme when reloading the configuration
  let g:config_already_loaded = 1

  call LMBackgroundLight()

  " For nvim-qt, the font size is read from ~/.config/nvim/ginit.vim
  if has("gui_running")
    set guifont=Input\ Mono\ 10


    if has('nvim')
      GuiFont Input\ Mono:h10
    endif
  else
    " Konsole does not support cursor shapes, which makes it
    " print extraneous 'q' characters. Re-enable this if that is a problem
    set guicursor=
  endif
endif

" Completion: Used by nvim-typescript
let g:deoplete#enable_at_startup = 1

let g:nvim_typescript#signature_complete = 1
let g:nvim_typescript#max_completion_detail = 25
let g:nvim_typescript#tsimport#template = 'import { %s } from "%s";'

let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 4
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'none'

let g:prettier#quickfix_enabled = 0

" Run prettier on all specified files at save.
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync

let g:alternateExtensions_{'tsx'} = "scss"
let g:alternateExtensions_{'scss'} = "tsx"
