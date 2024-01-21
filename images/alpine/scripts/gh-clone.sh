#!/bin/bash


BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 
log "start" "Clone git repo"
log "info" "Setting git config..."

TEST_CMD="source ${BASE_PATH}/check-var.sh"
# alias ckvar='$TEST_CMD'
$TEST_CMD "GIT_REPO_NAME" "debug"
$TEST_CMD "GIT_PAT_TOKEN" "debug"
# ckvar GIT_REPO_NAME "debug"
# ckvar GIT_PAT_TOKEN "debug"

# Authenticate
log "info" "Authenticating..."
echo $GIT_PAT_TOKEN > .GIT_PAT_TOKEN
gh auth login --with-token < .GIT_PAT_TOKEN
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > .GIT_PAT_TOKEN
rm .GIT_PAT_TOKEN

# wyattmunson/private-repo 
# https://github.com/wyattmunson/private-repo.git

gh repo clone ${GIT_REPO_NAME}
