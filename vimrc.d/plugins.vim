" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Load all plugins
Plugin 'mustache/vim-mode.git'
Plugin 'sandeepcr529/Buffet.vim.git' " Buffer explorer
Plugin 'lmeijvogel/vim-yaml-helper.git' " Some helper methods for YAML files
Plugin 'wzzrd/vim-matchit.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'bogado/file-line.git' " Copy file/line to clipboard
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'duff/vim-scratch.git' " Scratch buffer
Plugin 'mbbill/undotree' " Undo history visualisation
Plugin 'tpope/vim-surround.git'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'scrooloose/syntastic.git'
Plugin 'mileszs/ack.vim.git'
Plugin 'jpo/vim-railscasts-theme.git' " Dark color scheme
Plugin 'vim-scripts/bufkill.vim.git' " Commands for deleting the current buffer
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'gmarik/Vundle.vim.git'
Plugin 'tpope/vim-endwise.git' " Automatically close begin/end statements
Plugin 'tyok/nerdtree-ack.git'
Plugin 'tpope/vim-unimpaired.git' " Bracket commands: ]b, etc.
Plugin 'tpope/vim-rsi.git' " Readline style insertions
Plugin 'tpope/vim-fugitive.git'
Plugin 'ctrlpvim/ctrlp.vim.git' " Fuzzy file search
Plugin 'junegunn/vim-easy-align.git'
Plugin 'editorconfig/editorconfig-vim.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'ntpeters/vim-better-whitespace' " Better whitespace highlighting
Plugin 'jgdavey/tslime.vim'
Plugin 'jgdavey/vim-turbux'
Plugin 'vim-scripts/summerfruit256.vim' " Light color scheme
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-rails'
Plugin 'buztard/vim-rel-jump' " Store relative jumps (5j, 3k) in the jump list
Plugin 'ap/vim-buftabline' " Buffer list at top of screen
Plugin 'easymotion/vim-easymotion'
Plugin 'kassio/neoterm'
Plugin 'posva/vim-vue'
Plugin 'janko-m/vim-test'

call vundle#end()
call yankstack#setup()
filetype off
filetype plugin indent on
