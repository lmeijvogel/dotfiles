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


if [ -f "$HOME/.bashrc_private" ]; then
  if [ -x "$HOME/.bashrc_private" ]; then
    . "$HOME/.bashrc_private"
  else
    echo ".bashrc_private is not executable. Not executed."
  fi
fi

if [ -x "$HOME/.git-completion.bash" ]; then
  . "$HOME/.git-completion.bash"
fi

if [ -d "$HOME/.rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -e "$HOME/.custom_bash_prompt.bash" ]; then
  . "$HOME/.custom_bash_prompt.bash"
fi

if [ -f /usr/share/terminfo/x/xterm+256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Allow pattern-matching with **
shopt -s globstar

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
