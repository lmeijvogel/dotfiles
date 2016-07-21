set nocompatible

filetype off

source $MYVIMRC.d/global.vim
nmap <silent> <leader>e1v :e $MYVIMRC.d/global.vim<CR>
source $MYVIMRC.d/commands.vim
nmap <silent> <leader>e2v :e $MYVIMRC.d/commands.vim<CR>
source $MYVIMRC.d/plugins.vim
nmap <silent> <leader>e3v :e $MYVIMRC.d/plugins.vim<CR>
source $MYVIMRC.d/plugin_commands.vim
nmap <silent> <leader>e4v :e $MYVIMRC.d/plugin_commands.vim<CR>
