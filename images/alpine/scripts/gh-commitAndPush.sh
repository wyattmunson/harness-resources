#!/bin/bash

BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 

log "start" "Git commit"
log "info" "Setting git config..."

# echo "source ${BASE_PATH}/check-var.sh"
TEST_CMD="source ${BASE_PATH}/check-var.sh"
alias ckvar="$TEST_CMD"
ckvar GIT_PAT_USERNAME "debug"
ckvar GIT_PAT_TOKEN "debug"

log "info" "Loggin in..."
echo $GIT_PAT_TOKEN > .GIT_PAT_TOKEN
gh auth login --with-token < .GIT_PAT_TOKEN
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > .GIT_PAT_TOKEN
rm .GIT_PAT_TOKEN

# git clone https://$GIT_AUTH_TOKEN@$GIT_BASE_URL/$GIT_ORG_NAME/$GIT_REPO_NAME.git
# git remote set-url origin https://$GIT_PAT_USERNAME:$GIT_AUTH_TOKEN@github.com/$GIT_ORG_NAME/$GIT_REPO_NAME.git

# set git config
GIT_EMAIL="${GIT_EMAIL:-"harness-pipeline@example.com"}"
GIT_NAME="${GIT_NAME:="Harness Pipeline Automation"}"
log "info" "Set git email to: $GIT_EMAIL"
log "info" "Set git name to: $GIT_NAME"

git config --global user.email "harness-pipeline@example.io"
git config --global user.email "Harness Pipeline Automation"

# get user specified file paths, else commit all files
GIT_COMMIT_FILES=${GIT_COMMIT_FILES:-"-A"}
GIT_COMMIT_MESSAGE=${GIT_COMMIT_MESSAGE:-"Files added in Harness pipeline run"}

# add and commit files
git add ${GIT_COMMIT_FILES}
git commit -m ${GIT_COMMIT_MESSAGE}
# git push ${}
# git add -A
# git commit -m 

# git config --global url."https://your_username:$GIT_AUTH_TOKEN@github.com/".insteadOf "https://github.com/"
# git remote set-url origin https://your_username:$GIT_AUTH_TOKEN@github.com/your_username/your_repo.git
