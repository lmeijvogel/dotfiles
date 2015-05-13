" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()

" Load all plugins
Plugin 'mustache/vim-mode.git'
Plugin 'sandeepcr529/Buffet.vim.git'
Plugin 'lmeijvogel/vim-yaml-helper.git'
Plugin 'wzzrd/vim-matchit.git'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'vim-scripts/argtextobj.vim.git'
Plugin 'bogado/file-line.git'
Plugin 'techlivezheng/vim-plugin-minibufexpl.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'takac/vim-hardtime.git'
Plugin 'nelstrom/vim-textobj-rubyblock.git'
Plugin 'ervandew/screen.git'
Plugin 'tpope/vim-haml.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'kana/vim-textobj-user.git'
Plugin 'duff/vim-scratch.git'
Plugin 'lmeijvogel/vim-screen-test-runner.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'tpope/vim-surround.git'
Plugin 'vim-scripts/YankRing.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'mileszs/ack.vim.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'vim-scripts/bufkill.vim.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'gmarik/Vundle'
Plugin 'tpope/vim-endwise.git'
Plugin 'tyok/nerdtree-ack.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-rsi.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'freeo/vim-kalisi.git'
Plugin 'mhinz/vim-startify.git'
Plugin 'junegunn/vim-easy-align.git'


call vundle#end()
filetype off
filetype plugin indent on
