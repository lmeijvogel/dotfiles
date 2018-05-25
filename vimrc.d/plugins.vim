" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Load all plugins
Plugin 'sandeepcr529/Buffet.vim.git' " Buffer explorer
Plugin 'lmeijvogel/vim-yaml-helper.git' " Some helper methods for YAML files
Plugin 'andymass/vim-matchup' " Enhances the '%' key to match more patterns.
Plugin 'scrooloose/nerdtree.git'
Plugin 'bogado/file-line.git' " Copy file/line to clipboard
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'duff/vim-scratch.git' " Scratch buffer
Plugin 'mbbill/undotree' " Undo history visualisation
Plugin 'machakann/vim-sandwich'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'mileszs/ack.vim.git'
Plugin 'vim-scripts/bufkill.vim.git' " Commands for deleting the current buffer
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'gmarik/Vundle.vim.git'
Plugin 'tpope/vim-endwise.git' " Automatically close begin/end statements
Plugin 'tyok/nerdtree-ack.git'
Plugin 'tpope/vim-unimpaired.git' " Bracket commands: ]b, etc.
Plugin 'tpope/vim-rsi.git' " Readline style insertions
Plugin 'tpope/vim-fugitive.git'
Plugin 'editorconfig/editorconfig-vim.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'ntpeters/vim-better-whitespace' " Better whitespace highlighting
Plugin 'jgdavey/tslime.vim'
Plugin 'jgdavey/vim-turbux'
Plugin 'vim-scripts/summerfruit256.vim' " Light color scheme
Plugin 'buztard/vim-rel-jump' " Store relative jumps (5j, 3k) in the jump list
Plugin 'ap/vim-buftabline' " Buffer list at top of screen
Plugin 'easymotion/vim-easymotion'
Plugin 'kassio/neoterm'
Plugin 'posva/vim-vue'
Plugin 'janko-m/vim-test'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'idanarye/vim-merginal.git'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'lmeijvogel/nerdtree-copypaste'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'romainl/vim-cool' " Automatically clears search highlights
Plugin 'prettier/vim-prettier'
Plugin 'drewtempelmeyer/palenight.vim' " Dark color scheme
Plugin 'jeetsukumaran/vim-indentwise' " Easy navigation based on indent level
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'

if !exists('g:gui_oni')
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'mhartington/nvim-typescript'
  Plugin 'leafgarland/typescript-vim'
end

call vundle#end()
call yankstack#setup()
filetype off
filetype plugin indent on
