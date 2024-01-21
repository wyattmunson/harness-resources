# Notes

## Git

Auth with pat

```
git config --global url."https://your_username:$GIT_AUTH_TOKEN@github.com/".insteadOf "https://github.com/"
git remote set-url origin https://your_username:$GIT_AUTH_TOKEN@github.com/your_username/your_repo.git
```

### gh-clone

Clone a repository from GitHub.

| Vars          | Required | Description                                                  |
| ------------- | -------- | ------------------------------------------------------------ |
| GIT_REPO_PATH | Yes      | Repo org and name `vendor/app-name`. Can also git a git URL. |
| GIT_PAT_TOKEN | Yes      | GitHub Personal Access Token                                 |

- `GIT_REPO_PATH` - this is the org and name of the repository, like `acmecorp/website-frontend`. This can also accept a full URL path if using GitHub at a custom location like `https://git.example.com/acme-corp/website-frontend`.

### gh-commitAndPush

Commit changes to the codebase and push to the remote repository.

| Vars               | Required | Description                                                                               |
| ------------------ | -------- | ----------------------------------------------------------------------------------------- |
| GIT_REPO_PATH      | Yes      | Repo org and name `vendor/app-name`. Can also git a git URL.                              |
| GIT_PAT_TOKEN      | Yes      | GitHub Personal Access Token                                                              |
| AUTHOR_EMAIL       |          | Email address of author associated with commit.                                           |
| AUTHOR_NAME        |          | Name of author associated with commit.                                                    |
| SKIP_PUSH          |          | Set to `true` to skip git push step and only commit changes.                              |
| GIT_COMMIT_FILES   |          | Enter one or more files or paths for to include in the commit. Defaults to all files.     |
| GIT_COMMIT_MESSAGE |          | Message for the commit. Defaults to generic message.                                      |
| REPO_LOCATION      |          | Relative or absolute filepath on system to find repo. Defaults to current directory.      |
| GIT_BRANCH         |          | Branch name to checkout to. Does not need to exist on remote. Defaults to current branch. |

- `GIT_PAT_TOKEN` - GitHub Personal Access Token
- `AUTHOR_EMAIL` - Email address of author associated with commit.
- `AUTHOR_NAME` - Name of author associated with commit.
- `SKIP_PUSH` - Set to `true` to skip git push step and only commit changes.
- `GIT_COMMIT_FILES` - Enter one or more files or paths for to include in the commit. Defaults to all files.
  - Specify multiple paths like `**/*.js package.json`
- `GIT_COMMIT_MESSAGE` - Message for the commit. Defaults to generic message.
- `REPO_LOCATION` - Relative or absolute filepath on system to find repo. Defaults to current directory.
- `GIT_BRANCH` - Branch name to checkout to. Does not need to exist on remote. Defaults to current branch.

### gh-merge

Merge a PR in GitHub.

| Vars          | Required | Description                                                                          |
| ------------- | -------- | ------------------------------------------------------------------------------------ |
| GIT_REPO_PATH | Yes      | Repo org and name `vendor/app-name`. Can also git a git URL.                         |
| GIT_PAT_TOKEN | Yes      | GitHub Personal Access Token                                                         |
| GIT_BRANCH    | NO       | Name of target branch that will be merged into source branch.                        |
| MERGE_METHOD  | NO       | Merge method (`merge`,`squash`, `rebase`). Defaults to `merge`.                      |
| ADMIN         | NO       | Use admin priviledges to override PRs that don't meet merge requirements.            |
| AUTO          | NO       | Merge this branch as soon as the required checks pass.                               |
| DISABLE_AUTO  | NO       | Disable auto merge for this PR.                                                      |
| SUBJECT       | NO       | Text for subject of the PR merge commit.                                             |
| BODY          | NO       | Text for body of the PR merge commit.                                                |
| AUTHOR_EMAIL  | NO       | Email address of author associated with commit.                                      |
| REPO_LOCATION | NO       | Relative or absolute filepath on system to find repo. Defaults to current directory. |

## Local Development

There are some path complications when source files between local development machines, the final container, and the pipeline to build that container.

### Set `BASE_PATH`

To mitigate path issues, files are called using an absolute path. The default `BASE_PATH` is final container runtime at `/opt/wm/scripts`. In local development, this repository is cloned elsewhere and using the default path will cause errors.

Set the `BASE_PATH` envrionment variable to `./scripts`. Additionally, call all scripts from the same level as this README.

```bash
# set env var and run scripts from the same dir as this readme
export BASE_PATH="./scripts"
```
