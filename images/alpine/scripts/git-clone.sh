#!/bin/bash
# BASE_PATH=images/alpine/scripts
BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 
log "start" "Clone git repo"
log "info" "Setting git config..."

# git config --global url."https://your_username:$GIT_AUTH_TOKEN@github.com/".insteadOf "https://github.com/"
echo "source ${BASE_PATH}/check-var.sh"
TEST_CMD="source ${BASE_PATH}/check-var.sh"
alias ckvar="$TEST_CMD"
ckvar GIT_PAT_USERNAME "debug"
ckvar GIT_PAT_TOKEN "debug"
ckvar GIT_ORG_NAME "debug"
ckvar GIT_REPO_NAME "debug"

GIT_BASE_URL=${GIT_BASE_URL:-"github.com"}

log "info" "Cloning repo..."
git clone https://$GIT_AUTH_TOKEN@$GIT_BASE_URL/$GIT_ORG_NAME/$GIT_REPO_NAME.git
# git remote set-url origin https://$GIT_PAT_USERNAME:$GIT_AUTH_TOKEN@github.com/$GIT_ORG_NAME/$GIT_REPO_NAME.git
