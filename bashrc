# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Add alias 'cl' for cd .. ; ls
cl() {    if [ -d "$1" ]; then       cd "$1";       ls -l;    fi; }

# Add method to easily go to a gem directory
function cgem {
  pushd `bundle show $1`
}

# Private settings can be stored in .bashrc_private (see example file)

# User specific aliases and functions
alias sdf='git add -p'
alias lkj='gs'

alias yum='sudo yum'

alias rtst='RAILS_ENV=test bundle exec rake test'
alias rdfl='bundle exec rake db:fixtures:load'
alias rdsl='bundle exec rake db:schema:load'
alias trdsl='RAILS_ENV=test bundle exec rake db:schema:load'
alias rdtp='bundle exec rake db:test:prepare'

alias orig='find . -regex "\\(.*\\.\\(BACKUP\\|BASE\\|LOCAL\\|REMOTE\\)\\..*\\)\\|.*\\.orig" -delete'

alias gti='git'

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

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && . "$HOME/.scm_breeze/scm_breeze.sh"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -e "$HOME/.custom_bash_prompt.bash" ]; then
  . "$HOME/.custom_bash_prompt.bash"
fi

if [ -f /usr/share/terminfo/x/xterm+256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
