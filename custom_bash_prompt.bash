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

    ASCII_RESET="\e[0m"

    local GREEN="\e[0;32m"
    local GREEN_BOLD="\e[1;32m"
    local RED="\e[0;31m"
    local RED_BOLD="\e[1;31m"
    local BLUE="\e[0;34m"
    local BLUE_BOLD="\e[1;34m"
    local CYAN="\e[0;36m"
    local CYAN_BOLD="\e[1;36m"
    local YELLOW="\e[0;33m"
    local YELLOW_BOLD="\e[1;33m"
    local PURPLE="\e[0;35m"
    local PURPLE_BOLD="\e[1;35m"

    local ASCII_BOLD="\e[1m"

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
