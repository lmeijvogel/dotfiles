" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>lv :so $MYVIMRC<CR>

" Quickly clear search history
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly select next and previous search results
nmap <silent> <C-A-n> :cn<CR>
nmap <silent> <C-A-p> :cp<CR>

" Add aliases to catch typos
command! W w
command! Wq w
command! WQ w
command! Q q

command! Qa qa
command! -bang Qa qa<bang>
command! -bang QA qa<bang>

" Sudo write current file
cmap w!! w !sudo tee % >/dev/null

" Make S-y consistent with S-d etc.
nmap <silent> Y y$

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
nmap <silent> <leader>ss <C-w>s
nmap <silent> <leader>vv <C-w>v

" Easily resize splits
nmap <silent> <S-Up> <C-w>+
nmap <silent> <S-Down> <C-w>-
nmap <silent> <S-Left> <C-w><
nmap <silent> <S-Right> <C-w>>
nmap <silent> <Up> <C-w>8+
nmap <silent> <Down> <C-w>8-
nmap <silent> <Left> <C-w>8<
nmap <silent> <Right> <C-w>8>

" Delete trailing whitespace
map <F4> :%s/\s*$//<CR>:noh<CR>

nmap <silent> <leader>gb :!git gui blame %<CR>

" Replace Ruby rocket syntax with keyvalue syntax
nmap <leader>h :%s/:\([a-z3-9_]\{1,\}[!?]\?\) \?=>/\1:/g<CR>

" Disable Q (Ex mode) and K (man lookup)
nmap Q <Nop>
nmap K <Nop>

" Easy toggling of word wrap
nnoremap <leader>w :set wrap!<CR>

" Easier next/prev buffer
nmap <silent> <M-h> :bp<CR>
nmap <silent> <M-l> :bn<CR>

" These work well in combination with 'delete buffer' <M-S-d>:
" I don't have to press/lift Shift every time.
nmap <silent> <M-S-h> :bp<CR>
nmap <silent> <M-S-l> :bn<CR>

" Same with ctrl-tab
nmap <silent> <C-Tab> :bn<CR>
nmap <silent> <C-S-Tab> :bp<CR>

" Easy delete buffer
nmap <M-S-d> :BD<CR>

inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

if has('nvim')
  set inccommand=nosplit
endif
