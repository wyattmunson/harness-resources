#!/bin/bash

function git_check() {
    echo "running"


    BASE_PATH=${BASE_PATH:-"/opt/wm/scripts"}
    source ${BASE_PATH}/helpers/logger.sh

    # Check git
    git status &> /dev/null
    STATUS_CODE=$?

    # Evaluate response
    if [[ $1 = "warn" ]]; then
        if [[ "$STATUS_CODE" = "0" ]]; then return 0; fi
        logger "err" "Not in a git repository"
        return 1
    elif [[ $1 = "hard" || $1 = "exit" ]]; then
        if [[ "$STATUS_CODE" = "0" ]]; then return 0; fi
        logger "err" "Not in a git repository"
        exit 1
    else
        if [[ "$STATUS_CODE" = "0" ]]; then
            logger "info" "In a git repo"
            return 0
        fi
        logger "warn" "Not in a git repository"
        return 1
    fi
}