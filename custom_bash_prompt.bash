function prompt_command {
    local RETURN_CODE="$?"

    ASCII_RESET="\[\e[0m\]"

    local GREEN="\[\e[0;32m\]"
    local GREEN_BOLD="\[\e[1;32m\]"
    local RED="\[\e[0;31m\]"
    local RED_BOLD="\[\e[1;31m\]"
    local BLUE="\[\e[1;34m\]"
    local CYAN="\[\e[1;36m\]"
    local YELLOW="\[\e[1;33m\]"
    local PURPLE_BOLD="\[\e[1;35m\]"

    local ASCII_BOLD="\[\e[1m\]"
    local USERNAME_COLOR=$GREEN

    local PROMPT_COLOR=$GREEN
    if [[ ${EUID} == 0 ]] ; then
        PROMPT_COLOR=$RED
    fi

    RVM_VERSION_COLOR=$GREEN

    GIT_BRANCH_COLOR=$BLUE
    GIT_NOT_PUSHED_COLOR=$CYAN
    GIT_MERGING_COLOR=$YELLOW
    GIT_REBASING_COLOR=$YELLOW
    GIT_BISECTING_COLOR=$YELLOW

    GIT_MODIFIED_COLOR=$PURPLE_BOLD
    GIT_STAGED_COLOR=$GREEN_BOLD
    GIT_DELETED_COLOR=$RED_BOLD
    GIT_UNCHANGED_COLOR=$GREEN_BOLD

    local LOCAL_HOST_COLOR=$GREEN_BOLD
    local REMOTE_HOST_COLOR="\[\e[1;33;41m\]" # fg: Yellow, bg: Red
    local RETURN_CODE_COLOR=$RED_BOLD

    local HOST_NAME=`/bin/hostname -s`

    if [[ "$SAFE_HOSTNAMES" =~ "$HOST_NAME" ]] ; then
        local HOST_COLOR=$LOCAL_HOST_COLOR
    else
        local HOST_COLOR=$REMOTE_HOST_COLOR
        return
    fi

    local PROMPT_RETURN_CODE=""
    if [[ $RETURN_CODE != 0 ]] ; then
        PROMPT_RETURN_CODE=" $RETURN_CODE_COLOR$RETURN_CODE$ASCII_RESET"
    fi

    make_git_prompt

    local FIRST_LINE="$ASCII_BOLD[$HOST_COLOR\h$ASCII_RESET $RVM_VERSION_COLOR`rvm-prompt i v g`$ASCII_RESET$PROMPT_GIT_STATUS$PROMPT_RETURN_CODE $ASCII_RESET\w$ASCII_BOLD]$ASCII_RESET"
    local PROMPT_LINE="$LOCAL_GIT_STATUS$PROMPT_COLOR\\\$$ASCII_RESET "

    PS1="$FIRST_LINE\n$PROMPT_LINE"
}

function make_git_prompt {
    PROMPT_GIT_STATUS=""
    LOCAL_GIT_STATUS=""

    local GIT_STATUS=`git status 2>/dev/null`

    if [[ $GIT_STATUS != "" ]] ; then
        GIT_PATH=`git rev-parse --git-dir`
        make_git_current_branch "$GIT_STATUS"
        make_git_merge_status
        make_git_rebase_status
        make_git_bisect_status
        make_remote_git_status "$GIT_STATUS"
        make_local_git_status "$GIT_STATUS"

        PROMPT_GIT_STATUS=" $GIT_CURRENT_BRANCH$GIT_MERGE_STATUS$GIT_REBASE_STATUS$GIT_BISECT_STATUS$REMOTE_GIT_STATUS$ASCII_RESET"
    fi
}

function make_git_current_branch {
    local GIT_STATUS=$1

    GIT_CURRENT_BRANCH="$(git symbolic-ref HEAD 2>/dev/null)"

    GIT_CURRENT_BRANCH="$GIT_BRANCH_COLOR${GIT_CURRENT_BRANCH#refs/heads/}"
}

function make_git_rebase_status {
    GIT_REBASE_STATUS=""

    if [[ -f $GIT_PATH/rebase-apply/rebasing ]] ; then
      # Rebase one branch onto another
      local OTHER_BRANCH=`cat "$GIT_PATH/rebase-apply/onto" | git name-rev --name-only --stdin`
      local LOCAL_BRANCH=`cat "$GIT_PATH/rebase-apply/head-name"`
      LOCAL_BRANCH="${LOCAL_BRANCH#refs/heads/}"

      GIT_REBASE_STATUS="$GIT_REBASING_COLOR $LOCAL_BRANCH rebasing onto $OTHER_BRANCH$ASCII_RESET"
    elif [[ -f $GIT_PATH/rebase-merge/interactive ]] ; then
      local HEAD_NAME=`cat "$GIT_PATH/rebase-merge/head-name"`
      local HEAD_NAME="${HEAD_NAME#refs/heads/}"
      local ONTO_NAME=`cat "$GIT_PATH/rebase-merge/onto" | git name-rev --name-only --stdin`

      GIT_REBASE_STATUS="$GIT_REBASING_COLOR rebasing $ONTO_NAME...$HEAD_NAME$ASCII_RESET"
    fi
}

function make_git_bisect_status {
  GIT_BISECT_STATUS=""

  if [[ -f $GIT_PATH/BISECT_START ]] ; then
    GIT_BISECT_STATUS="$GIT_BISECTING_COLOR bisecting$ASCII_RESET"
  fi
}

function make_git_merge_status {
    GIT_MERGE_STATUS=""

    if [[ -f $GIT_PATH/MERGE_HEAD ]] ; then
      local OTHER_BRANCH=`cat "$GIT_PATH/MERGE_HEAD" | git name-rev --name-only --stdin`

      GIT_MERGE_STATUS="$GIT_MERGING_COLOR merging ${OTHER_BRANCH#remotes/}$ASCII_RESET"
    fi
}

function make_remote_git_status {
    local GIT_STATUS=$1
    local RESULT=""

    if [[ `echo $GIT_STATUS | grep "ahead of"` != "" ]] ; then
        local AHEAD_COUNT=`echo "$GIT_STATUS" | grep "ahead of" | sed 's/.*by \(.*\) \w*\./\1/'`
        RESULT+=" ${GIT_NOT_PUSHED_COLOR}${AHEAD_COUNT} ahead"
    elif [[ `echo $GIT_STATUS | grep "is behind"` != "" ]] ; then
        local BEHIND_COUNT=`echo "$GIT_STATUS" | grep "is behind" | sed 's/.*by \(.*\) commit.*\./\1/'`
        RESULT+=" ${GIT_NOT_PUSHED_COLOR}${BEHIND_COUNT} behind"
    elif [[ `echo $GIT_STATUS | grep "have diverged"` != "" ]] ; then
        local DIVERGED_COUNTS=`echo "$GIT_STATUS" | grep "different commit(s)" | sed 's/.*and have \(.*\) and \(.*\) different commit(s).*/\1 > \2/'`
        RESULT+=" ${GIT_NOT_PUSHED_COLOR}diverged ${DIVERGED_COUNTS}"
    fi

    REMOTE_GIT_STATUS=$RESULT
}


function make_local_git_status {
    local GIT_STATUS=$1
    local RESULT=""

    if [[ `echo $GIT_STATUS | grep "nothing to commit"` != "" ]] ; then
        RESULT+="${GIT_UNCHANGED_COLOR}==$ASCII_RESET"
    fi

    if [[ `echo $GIT_STATUS | grep "Changes not staged for commit:"` != "" ]] ; then
        RESULT+="${GIT_MODIFIED_COLOR}M$ASCII_RESET"
    fi

    if [[ `echo $GIT_STATUS | grep "Changes to be committed:"` != "" ]] ; then
        RESULT+="${GIT_STAGED_COLOR}S$ASCII_RESET"
    fi

    if [[ `echo $GIT_STATUS | grep "Untracked files:"` != "" ]] ; then
        RESULT+="${GIT_MODIFIED_COLOR}?$ASCII_RESET"
    fi

    if [[ `echo $GIT_STATUS | grep "deleted"` != "" ]] ; then
        RESULT+="${GIT_DELETED_COLOR}-$ASCII_RESET"
    fi

    if [[ "$RESULT" != "" ]] ; then
      RESULT=" $RESULT "
    fi

    LOCAL_GIT_STATUS=$RESULT
}

readonly -f prompt_command

export PROMPT_COMMAND=prompt_command
