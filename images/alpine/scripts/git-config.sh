#!/bin/bash
# BASE_PATH=images/alpine/scripts
BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 
log "start" "Git config"
log "info" "Setting git config..."

# should set git config email and name as global harness variable
GIT_EMAIL="${GIT_EMAIL:-"harness-pipeline@example.com"}"
GIT_NAME="${GIT_NAME:="Harness Pipeline Automation"}"
log "info" "Set git email to: $GIT_EMAIL"
log "info" "Set git name to: $GIT_NAME"

# git config --global user.email "harness-pipeline@example.io"
# git config --global user.name "Harness Pipeline Automation"

# git config --global url."https://your_username:$GIT_AUTH_TOKEN@github.com/".insteadOf "https://github.com/"
echo "source ${BASE_PATH}/check-var.sh"
TEST_CMD="source ${BASE_PATH}/check-var.sh"
# alias ckvar="source ${BASE_PATH}/check-var.sh"
alias ckvar="$TEST_CMD"
ckvar GIT_PAT_USERNAME "debug"
ckvar GIT_PAT_TOKEN "debug"
ckvar GIT_ORG_NAME "debug"
ckvar GIT_REPO_NAME "debug"
git remote set-url origin https://$GIT_PAT_USERNAME:$GIT_AUTH_TOKEN@github.com/$GIT_ORG_NAME/$GIT_REPO_NAME.git

# if [[ "$0" = "0" ]]; then
#     echo "success"
# else
#     echo "success"
# fi