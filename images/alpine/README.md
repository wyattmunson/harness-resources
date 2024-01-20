# Notes

## Git

Auth with pat

```
git config --global url."https://your_username:$GIT_AUTH_TOKEN@github.com/".insteadOf "https://github.com/"
git remote set-url origin https://your_username:$GIT_AUTH_TOKEN@github.com/your_username/your_repo.git
```
