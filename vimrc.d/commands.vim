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

" Delete trailing whitespace
nmap <silent> <leader>dtw :s/\s*$//<CR>:noh<CR>
nmap <silent> <leader>gdtw :%s/\s*$//<CR>:noh<CR>
" Alias for gdtw
map <F4> :%s/\s*$//<CR>:noh<CR>

nmap <silent> <leader>gb :!git gui blame %<CR>

" Replace Ruby rocket syntax with keyvalue syntax
nmap <leader>h :%s/:\([a-z3-9_]\{1,\}[!?]\?\) \?=>/\1:/g<CR>
