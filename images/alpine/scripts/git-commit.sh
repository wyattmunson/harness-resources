#!/bin/bash


function log() {
    if [[ "$1" = "info" ]]; then
        echo "INFO : $2"
    elif [[ "$1" = "err" || "$1" = "error" ]]; then
        echo "ERROR: $2"
    elif [[ "$1" = "start" ]]; then
        echo "START: $2"
    elif [[ "$1" = "done" ]]; then
        echo "START: $2"
    elif [[ "$1" = "warn" ]]; then
        echo "WARN : $2"
    elif [[ "$1" = "done" ]]; then
        echo "DEBUG: $2"
    else
        echo "LOG  : $2"
    fi
}

log "start" "Git commit"
log "info" "Setting git config..."

# should set git config email and name as global harness variable
GIT_EMAIL="${GIT_EMAIL:-"harness-pipeline@example.com"}"
GIT_NAME="${GIT_NAME:="Harness Pipeline Automation"}"
log "info" "Set git email to: $GIT_EMAIL"
log "info" "Set git name to: $GIT_NAME"

# git config --global user.email "harness-pipeline@example.io"
# git config --global user.email "Harness Pipeline Automation"

# git config --global url."https://your_username:$GIT_AUTH_TOKEN@github.com/".insteadOf "https://github.com/"
# git remote set-url origin https://your_username:$GIT_AUTH_TOKEN@github.com/your_username/your_repo.git

