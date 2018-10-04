alias rake='bundle exec rake'

alias orig='cd `git rev-parse --show-toplevel` ; git status --untracked --porcelain | grep "^\\?\\?" | awk -e "{ print \$2; }" | grep "\\(\\.orig$\\)\\|\\.\\(BACKUP\\|BASE\\|LOCAL\\|REMOTE\\)\\." | xargs rm'
alias gti='git'
alias igt='git'
alias qgit='git'

alias brr='br --remote'
alias brrr='br --remote'
alias brrrr='br --remote'
alias brrrrr='br --remote'
alias brrrrrr='br --remote'

alias be='bundle exec'

alias conf="cd ~/.dotfiles"

alias o='xdg-open'

alias vi='nvim'
alias vim='nvim'
alias gvim='nvim-qt'

alias nq='nvim-qt'

alias k1='kill %1'
alias k91='kill -9 %1'

alias sa='ssh-add'

cl() { if [ -d "$1" ]; then cd "$1"; ls -l; else echo "*** Directory not found ***" ; fi; }

# Allow custom aliases per environment
[[ -x "$HOME/.aliases_private.sh" ]] && . "$HOME/.aliases_private.sh"
