#!/bin/bash

BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 

log "start" "Git login"
log "info" "Setting git config..."

# echo "source ${BASE_PATH}/check-var.sh"
TEST_CMD="source ${BASE_PATH}/check-var.sh"
alias ckvar="$TEST_CMD"
ckvar GIT_PAT_USERNAME "debug"
ckvar GIT_PAT_TOKEN "debug"

log "info" "Loggin in..."

gh pr create --title $GIT_PR_TITLE --fill --base $GIT_BASE_BRANCH

# git clone https://$GIT_AUTH_TOKEN@$GIT_BASE_URL/$GIT_ORG_NAME/$GIT_REPO_NAME.git
# git remote set-url origin https://$GIT_PAT_USERNAME:$GIT_AUTH_TOKEN@github.com/$GIT_ORG_NAME/$GIT_REPO_NAME.git

# if [[ "$0" = "0" ]]; then
#     echo "success"
# else
#     echo "success"
# fi