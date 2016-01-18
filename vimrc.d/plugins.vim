" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Load all plugins
Plugin 'mustache/vim-mode.git'
Plugin 'sandeepcr529/Buffet.vim.git'
Plugin 'lmeijvogel/vim-yaml-helper.git'
Plugin 'wzzrd/vim-matchit.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'bogado/file-line.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'duff/vim-scratch.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'tpope/vim-surround.git'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'scrooloose/syntastic.git'
Plugin 'mileszs/ack.vim.git'
Plugin 'jpo/vim-railscasts-theme.git'
Plugin 'vim-scripts/bufkill.vim.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'gmarik/Vundle.vim.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tyok/nerdtree-ack.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-rsi.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'junegunn/vim-easy-align.git'
Plugin 'editorconfig/editorconfig-vim.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jgdavey/tslime.vim'
Plugin 'jgdavey/vim-turbux'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
call yankstack#setup()
filetype off
filetype plugin indent on
