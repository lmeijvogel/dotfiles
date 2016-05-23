alias yum='sudo yum'

alias rtst='RAILS_ENV=test bundle exec rake test'
alias rdfl='bundle exec rake db:fixtures:load'
alias rdsl='bundle exec rake db:schema:load'
alias trdsl='RAILS_ENV=test bundle exec rake db:schema:load'
alias rdtp='bundle exec rake db:test:prepare'
alias rmig='bundle exec rake db:migrate'
alias rmigt='RAILS_ENV=test bundle exec rake db:migrate'

alias orig='find . -regex "\\(.*\\(BACKUP\\|BASE\\|LOCAL\\|REMOTE\\).*\\|.*\\.orig\\).*" -delete'

alias gti='git'
alias igt='git'
alias qgit='git'

alias gs='git status'

# Allow custom aliases per environment
[[ -x "$HOME/.aliases_private.sh" ]] && . "$HOME/.aliases_private.sh"
