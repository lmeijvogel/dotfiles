source $HOME/.git_prompt.sh

function shell_for_prompt {
  if [[ "$1" == "bash" ]]; then
    export SHELL_FOR_PROMPT="bash"

    export PROMPT_COMMAND=prompt_command
  elif [[ "$1" == "zsh" ]]; then
    export SHELL_FOR_PROMPT="zsh"

    autoload -U colors && colors

    function precmd() {
      PROMPT="$(prompt_command)"
    }

  fi
}

function prompt_command {
    local RETURN_CODE="$?"

    if [[ "$SHELL_FOR_PROMPT" == "zsh" ]]; then
      ASCII_RESET="%{$reset_color%}"

      GREEN="%{$fg[green]%}"
      RED="%{$fg[red]%}"
      BLUE="%{$fg[blue]%}"
      CYAN="%{$fg[cyan]%}"
      YELLOW="%{$fg[yellow]%}"
      PURPLE="%{$fg[magenta]%}"
      GREEN_BOLD="%{$fg_bold[green]%}"
      RED_BOLD="%{$fg_bold[red]%}"
      BLUE_BOLD="%{$fg_bold[blue]%}"
      CYAN_BOLD="%{$fg_bold[cyan]%}"
      YELLOW_BOLD="%{$fg_bold[yellow]%}"
      PURPLE_BOLD="%{$fg_bold[magenta]%}"
    else
      ASCII_RESET="\e[0m"
      GREEN="\e[0;32m"
      GREEN_BOLD="\e[1;32m"
      RED="\e[0;31m"
      RED_BOLD="\e[1;31m"
      BLUE="\e[0;34m"
      BLUE_BOLD="\e[1;34m"
      CYAN="\e[0;36m"
      CYAN_BOLD="\e[1;36m"
      YELLOW="\e[0;33m"
      YELLOW_BOLD="\e[1;33m"
      PURPLE="\e[0;35m"
      PURPLE_BOLD="\e[1;35m"

      ASCII_BOLD="\e[1m"
    fi


    local USERNAME_COLOR=$GREEN

    local PROMPT_COLOR=$GREEN
    if [[ ${EUID} == 0 ]] ; then
        PROMPT_COLOR=$RED
    fi

    RVM_VERSION_COLOR=$GREEN

    GIT_BRANCH_COLOR=$BLUE_BOLD
    GIT_NOT_PUSHED_COLOR=$CYAN_BOLD
    GIT_MERGING_COLOR=$YELLOW_BOLD
    GIT_REBASING_COLOR=$YELLOW_BOLD
    GIT_BISECTING_COLOR=$YELLOW_BOLD

    GIT_MODIFIED_COLOR=$PURPLE_BOLD
    GIT_STAGED_COLOR=$GREEN_BOLD
    GIT_DELETED_COLOR=$RED_BOLD
    GIT_UNCHANGED_COLOR=$GREEN_BOLD

    local HOST_COLOR=$GREEN_BOLD
    local RETURN_CODE_COLOR=$RED_BOLD

    local PROMPT_RETURN_CODE=""

    if [[ $RETURN_CODE != 0 ]] ; then
        PROMPT_RETURN_CODE=" $RETURN_CODE_COLOR$RETURN_CODE$ASCII_RESET"
    fi

    make_git_prompt

    if [[ "$SHELL_FOR_PROMPT" == "zsh" ]]; then
      PROMPT_HOST="%m"
      PROMPT_DIR="%."

      PREFIX="Z"
    else
      PROMPT_HOST="\h"
      PROMPT_DIR="\w"

      PREFIX="B"
    fi
    # To prevent an error, split the string after $ASCII_BOLD
    local FIRST_LINE="$ASCII_BOLD$PREFIX [$HOST_COLOR$PROMPT_HOST$ASCII_RESET $RVM_VERSION_COLOR`rvm-prompt i v g`$ASCII_RESET$PROMPT_GIT_STATUS$PROMPT_RETURN_CODE $ASCII_RESET$PROMPT_DIR$ASCII_BOLD]$ASCII_RESET"
    local PROMPT_LINE="$LOCAL_GIT_STATUS$PROMPT_COLOR\\\$$ASCII_RESET "

    PS1="$FIRST_LINE\n$PROMPT_LINE"

    if [[ "$SHELL_FOR_PROMPT" == "zsh" ]]; then
      echo $PS1
    fi
}
