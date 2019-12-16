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
command! Wq wq
command! WQ wq
command! Q q

command! Qa qa
command! Wqa wqa
command! -bang Qa qa<bang>
command! -bang QA qa<bang>
command! -bang Wqa wqa<bang>

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
nmap <silent> <M-S-Up> <C-w>+
nmap <silent> <M-S-Down> <C-w>-
nmap <silent> <M-S-Left> <C-w><
nmap <silent> <M-S-Right> <C-w>>
nmap <silent> <M-Up> <C-w>8+
nmap <silent> <M-Down> <C-w>8-
nmap <silent> <M-Left> <C-w>8<
nmap <silent> <M-Right> <C-w>8>

nmap <silent> <leader>gb :!git gui blame %

" Replace Ruby rocket syntax with keyvalue syntax
command! LMRewriteRockets %s/:\([a-z3-9_]\{1,\}[!?]\?\) \?=>/\1:/g

" Delete trailing whitespace
command! LMDeleteTrailing %s/\s*$//<CR>:noh

" Easy toggling of word wrap
command! LMToggleWrap set wrap!

" Remap Q to 'run last macro'
nmap Q @@

" Disable K (man lookup)
nmap K <Nop>

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

" Add "large" jumps to the jump list
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Navigate through git conflict markers a bit more easily
nmap <leader>m /^<<<\\|^====\\|^>>><CR>

" Only redraw screen _after_ a macro is finished
set lazyredraw
