#!/bin/bash

BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 

log "start" "Git commit"
log "info" "Setting git config..."


# MOVE TO REPO DIRECTORY
REPO_LOCATION=${REPO_LOCATION:="."}
log "info" "Accessing repo at '$REPO_LOCATION'"
cd $REPO_LOCATION

# CHECK IF IN GIT REPO
git status &> /dev/null
if [[ "$?" != "0" ]]; then 
    log "error" "Not in a git repository. Exiting."
    log "error" "Set the variable 'REPO_LOCATION' to specify the file path to code repo or clone it first."
    # TODO: In prod this failure should exit the script
    return 1
else 
    echo "Repo found - DAT delete after testing"
fi

# CHECK REQUIRED VARS
TEST_CMD="source ${BASE_PATH}/check-var.sh"
$TEST_CMD "GIT_PAT_TOKEN" "debug"
$TEST_CMD "GIT_BRANCH" "debug"

# checkout if necessary
# if [[ -n "$(git branch | grep main)" ]]; then echo "yes"; fi
# git checkout

# Authention and credential setup
log "info" "Loggin in..."
echo $GIT_PAT_TOKEN > .GIT_PAT_TOKEN
gh auth login --with-token < .GIT_PAT_TOKEN
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > .GIT_PAT_TOKEN
rm .GIT_PAT_TOKEN
gh auth setup-git

# CHECKOUT BRANCH
# detect if should checkout
if [[ -n "$GIT_BRANCH" ]]; then
    log "info" "Checking out branch: $GIT_BRANCH"
    git fetch
    # detect if branch exists
    if [[ -n "$(git branch -r | grep $GIT_BRANCH)" ]]; then
        git checkout $GIT_BRANCH
        log "info" "Switched to branch: $GIT_BRANCH"
    else
        log "error" "Branch does not exist"
        # TODO: How to handle this use case? Should exit?
        # git checkout -b $GIT_BRANCH
    fi
else
    log "info" "No branch specified, using current branch"
fi



# GET AND SET AUTHOR METADATA
AUTHOR_EMAIL="${AUTHOR_EMAIL:-"harness-pipeline@example.com"}"
AUTHOR_NAME="${AUTHOR_NAME:-"Harness Pipeline Automation"}"
log "info" "Set git email to: $AUTHOR_EMAIL"
log "info" "Set git name to: $AUTHOR_NAME"
git config --global user.email "$AUTHOR_EMAIL"
git config --global user.name "$AUTHOR_NAME"

# generate commit message
GIT_COMMIT_MESSAGE=${GIT_COMMIT_MESSAGE:-"Merged by pipeline"}
# git commit -m "${GIT_COMMIT_MESSAGE}"

# AUTO MERGE
AUTO_MERGE_FLAG=""
if [[ "$AUTO_MERGE" = true ]]; then AUTO_MERGE_FLAG=" --auto"; fi

DISABLE_AUTO_MERGE_FLAG=""
if [[ "$DISABLE_AUTO_MERGE" = true ]]; then DISABLE_AUTO_MERGE_FLAG=" --auto"; fi

DELETE_BRANCH_FLAG=""
if [[ "$DELETE_BRANCH" = true ]]; then DELETE_BRANCH_FLAG=" --auto"; fi

ADMIN_FLAG=""
if [[ "$ADMIN" = true ]]; then ADMIN_FLAG=" --auto"; fi

SUBJECT_TEXT=""
if [[ -n "$SUBJECT" ]]; then SUBJECT_TEXT=" --subject $SUBJECT_TEXT"; fi

# MERGE METHOD
MERGE_METHOD_FLAG=""
if [[ "$MERGE_METHOD" = "rebase" ]]; then
    MERGE_METHOD_FLAG=" --rebase"
    log "info" "Using rebase merge method. Will rebase commits onto target branch"
elif [[ "$MERGE_METHOD" = "squash" ]]; then
    MERGE_METHOD_FLAG=" --squash"
    log "info" "Using squash merge method. Will squash commits into one commit and merge into base branch."
else
    # use standard merge method as standard method
    MERGE_METHOD_FLAG=" --merge"
    log "info" "Using basic merge method."
fi

gh pr merge ${MERGE_METHOD_FLAG}${AUTO_MERGE_FLAG}${DELETE_BRANCH_FLAG}${ADMIN_FLAG}${SUBJECT_TEXT}

# # exit if SKIP_PUSH
# if [[ "$SKIP_PUSH" = true ]]; then 
#     log "info" "Skipping push to remote"
#     exit 0
# fi

# # update config to push when theres no remote branch upstream
# git config --global --add --bool push.autoSetupRemote true
# log "info" "Pushing to remote..."
# git push

log "done" "Git merge PR"
