#
# Filesystem
#

alias ls="${aliases[ls]:-ls} --color=auto"
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.

#
# Git
#
alias g='git'

# Add (a)
alias ga='git add'
alias gap='git add --patch'
alias gau='git add --update'

# Branch (b)
alias gb='git branch'
alias gba='git branch --all --verbose'
alias gbc='git checkout -b'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbda='git fetch --all -pq; git branch -vv | grep ": gone]" | awk '"'"'{if ($1=="+") { print $2 } else {print $1}}'"'"' | xargs -n 1 git branch -D'
alias gbl='git branch --verbose'
alias gbL='git branch --all --verbose'
alias gbm='git branch --move'
alias gbM='git branch --move --force'
alias gbr='git branch --move'
alias gbR='git branch --move --force'
alias gbs='git show-branch'
alias gbS='git show-branch --all'
alias gbv='git branch --verbose'
alias gbV='git branch --verbose --verbose'
alias gbx='git branch --delete'
alias gbX='git branch --delete --force'

# Commit (c)
alias gc='git commit --verbose'
alias gca='git commit --amend --no-edit'
alias gcA='git commit --verbose --amend'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcf='git commit --fixup'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcsS='git show --pretty=short --show-signature'
alias gcl='git-commit-lost'
alias gcy='git cherry --verbose --abbrev'
alias gcY='git cherry --verbose'

# Conflict (C)
alias gCl='git --no-pager diff --name-only --diff-filter=U'
alias gCa='git add $(gCl)'
alias gCe='git mergetool $(gCl)'
alias gCo='git checkout --ours --'
alias gCO='gCo $(gCl)'
alias gCt='git checkout --theirs --'
alias gCT='gCt $(gCl)'

# Fetch (f)
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfc='git clone'
alias gfcr='git clone --recurse-submodules'
alias gfm='git pull'
alias gfma='git pull --autostash'
alias gfr='git pull --rebase'
alias gfra='git pull --rebase --autostash'

# Index (i)
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gii='git update-index --assume-unchanged'
alias giI='git update-index --no-assume-unchanged'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -r --force --cached'

# Log (l)
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_oneline_format='%C(green)%h%C(reset) %C(magenta)%<(14,trunc)%ar %C(blue)%<(20,trunc)%an%C(reset) %s%C(red)%d%C(reset)'
_git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'
alias gl='git log --topo-order --pretty=format:"$_git_log_medium_format"'
alias gls='git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
alias glo='git log --topo-order --pretty=format:"$_git_log_oneline_format"'
alias glg='git log --topo-order --graph --pretty=format:"$_git_log_oneline_format"'
alias glb='git log --topo-order --pretty=format:"$_git_log_brief_format"'
alias glc='git shortlog --summary --numbered'
alias glS='git log --show-signature'

# Merge (m)
alias gm='git merge'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool'

# Push (p)
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpF='git push --force'
alias gpa='git push --all'
alias gpA='git push --all && git push --tags'
alias gpt='git push --tags'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias gria='git rebase --interactive --autosquash'
alias grs='git rebase --skip'

# Remote (R)
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
alias gRu='git remote update'
alias gRp='git remote prune'
alias gRs='git remote show'
alias gRb='git-hub-browse'

# Stash (s)
alias gs='git stash'
alias gsa='git stash apply'
alias gsx='git stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='git stash list'
alias gsL='git-stash-dropped'
alias gsd='git stash show --patch --stat'
alias gsp='git stash pop'
alias gsr='git-stash-recover'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'

# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
alias gSm='git-submodule-move'
alias gSs='git submodule sync'
alias gSu='git submodule update --remote --recursive'
alias gSx='git-submodule-remove'

# Tag (t)
alias gt='git tag'
alias gtl='git tag --list'
alias gts='git tag --sign'
alias gtv='git verify-tag'

# Working Copy (w)
alias gws='git status'
alias gwS='git status --short'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean --dry-run'
alias gwC='git clean --force'
alias gwx='git rm -r'
alias gwX='git rm -r --force'

#
# Network
#
alias ip='curl ipecho.net/plain; echo'
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

#
# PNPM
#
alias pa='pnpm add'
alias pd='pnpm dev'
alias pi='pnpm install'
alias pf='pnpm --filter'
alias pr='pnpm remove'
alias pt='pnpm test'
alias ptc='pnpm test:coverage'
alias ptw='pnpm test:watch'
alias pu='pnpm upgrade'

#
# Yarn
#
alias ya='yarn add'
alias yi='yarn install'
alias ym='yarn run metrics'
alias yr='yarn remove'
alias ys='yarn start'
alias yt='yarn run test'
alias ytc='yarn run test:coverage'
alias ytw='yarn run test:watch'
alias yu='yarn upgrade'
alias yui='yarn upgrade-interactive'
alias yw='yarn workspace'
alias ywr='yarn workspaces run'
