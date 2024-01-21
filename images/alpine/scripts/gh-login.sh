#!/bin/bash

BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 

log "start" "Git login"
log "info" "Setting git config..."

# VALIDATE REQUIRED ENV VARS
TEST_CMD="source ${BASE_PATH}/check-var.sh"
$TEST_CMD "GIT_PAT_TOKEN" "debug"

# AUTH WITH GITHUB
log "info" "Loggin in..."
echo $GIT_PAT_TOKEN > .GIT_PAT_TOKEN
gh auth login --with-token < .GIT_PAT_TOKEN
# overwrite token value and delete
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > .GIT_PAT_TOKEN
rm .GIT_PAT_TOKEN
# setup git from gh-cli credentials
gh auth setup-git