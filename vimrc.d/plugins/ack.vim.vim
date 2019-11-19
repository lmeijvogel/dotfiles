" Ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
else
  let g:ackprg="/usr/bin/ack"
endif

nmap <leader>a :Ack! ""<C-b>
"
" Ack visual selection
vmap <leader>a "vy:Ack! "<C-r>v"
vmap <leader>A "vy:Ack! "<C-r>v"<CR>

" Ack word under cursor
nmap <leader>A viw A

command! Ackf :call AckCurrentFile()<CR>
command! LMAckCurrentFilename :call AckCurrentFile()<CR>

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
