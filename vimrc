set nocompatible

filetype off

source $HOME/.vimrc.d/global.vim
nmap <silent> <leader>e1v :e $HOME/.vimrc.d/global.vim<CR>
source $HOME/.vimrc.d/commands.vim
nmap <silent> <leader>e2v :e $HOME/.vimrc.d/commands.vim<CR>
source $HOME/.vimrc.d/plugins.vim
nmap <silent> <leader>e3v :e $HOME/.vimrc.d/plugins.vim<CR>
source $HOME/.vimrc.d/plugin_commands.vim
nmap <silent> <leader>e4v :e $HOME/.vimrc.d/plugin_commands.vim<CR>

nmap <silent> <leader>e5v :CocConfig<CR>
