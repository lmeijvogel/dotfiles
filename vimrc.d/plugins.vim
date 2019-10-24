call plug#begin('~/.vim/plugged')

" Load all plugins
Plug 'sandeepcr529/Buffet.vim' " Buffer explorer
Plug 'lmeijvogel/vim-yaml-helper' " Some helper methods for YAML files
Plug 'andymass/vim-matchup' " Enhances the '%' key to match more patterns.
Plug 'scrooloose/nerdtree'
Plug 'bogado/file-line' " Copy file/line to clipboard
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'duff/vim-scratch' " Scratch buffer
Plug 'mbbill/undotree' " Undo history visualisation
Plug 'tpope/vim-surround'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/bufkill.vim' " Commands for deleting the current buffer
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise' " Automatically close begin/end statements
Plug 'tyok/nerdtree-ack'
Plug 'tpope/vim-unimpaired' " Bracket commands: ]b, etc.
Plug 'tpope/vim-rsi' " Readline style insertions
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ntpeters/vim-better-whitespace' " Better whitespace highlighting
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-turbux'
Plug 'buztard/vim-rel-jump' " Store relative jumps (5j, 3k) in the jump list
Plug 'ap/vim-buftabline' " Buffer list at top of screen
Plug 'easymotion/vim-easymotion'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'idanarye/vim-merginal'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'lmeijvogel/nerdtree-copypaste'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier'
Plug 'fmoralesc/molokayo' " Dark color scheme

Plug 'jeetsukumaran/vim-indentwise' " Easy navigation based on indent level
Plug 'Shougo/vimproc.vim'
Plug 'nacitar/a.vim'                  " Easily alternate between related files
Plug 'rakr/vim-one' " Light color scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language Server Protocol client
Plug 'ianks/vim-tsx' " Correctly set filetype for tsx files
Plug 'mg979/vim-visual-multi'
Plug 'rbgrouleff/bclose.vim' " Close buffers while keeping windows open
Plug 'leafgarland/typescript-vim' " Syntax files for typescript

call plug#end()
call yankstack#setup()

filetype off
filetype plugin indent on
