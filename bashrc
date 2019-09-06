# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Private settings can be stored in .bashrc_private (see example file)

# User specific aliases and functions
[[ -x "$HOME/.aliases.sh" ]] && source "$HOME/.aliases.sh"

export VISUAL='vim'
export EDITOR='vim'

if [ -x "$HOME/.git-completion.bash" ]; then
  . "$HOME/.git-completion.bash"
fi

if [ -d "$HOME/.rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -f /usr/share/terminfo/x/xterm+256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Allow pattern-matching with **
shopt -s globstar

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/perl5/bin:$HOME/.rvm/bin:$PATH"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -s "/home/lennaert/.scm_breeze/scm_breeze.sh" ] && source "/home/lennaert/.scm_breeze/scm_breeze.sh"
